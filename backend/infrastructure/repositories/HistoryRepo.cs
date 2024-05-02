using Dapper;
using infrastructure.models;
using Npgsql;

namespace infrastructure.repositories;

public class HistoryRepo
{
    private readonly NpgsqlDataSource _dataSource;

    public HistoryRepo(NpgsqlDataSource dataSource)
    {
        _dataSource = dataSource;
    }

    public List<HistoryModel> GetHistory(DateTime? timePeriod)
    {
        string sql = "";
        string sqlGetUnit = "SELECT * FROM unit WHERE unitid IN (@unitid)";
        if (timePeriod != null)
        {
            sql =
                "SELECT historyid, unitid, \"User\".name, eventtype, date\n" +
                "FROM history\n" +
                "LEFT JOIN public.\"User\" on \"User\".mail = history.useremail WHERE history.date > @timePeriod";
        }
        else
        {
            sql =
                "SELECT historyid, unitid, \"User\".name, eventtype, date\n" +
                "FROM history\n" +
                "LEFT JOIN public.\"User\" on \"User\".mail = history.useremail";
        }

        using (var conn = _dataSource.OpenConnection())
        {
            List<HistoryModel> historyModels = conn.Query<HistoryModel>(sql).ToList();
            
            List<int> unitIds = historyModels.Select(historyModel => historyModel.UnitId).ToList();
            
            var unitIdParameters = new DynamicParameters();
            foreach (var unitId in unitIds)
            {
                unitIdParameters.Add($"{unitId}", unitId);
            }
            List<Unit> units = conn.Query<Unit>(sqlGetUnit, unitIdParameters).ToList();
            
            foreach (var historyModel in historyModels)
            {
                historyModel.Unit = units.Find(unit => unit.UnitId == historyModel.UnitId);
            }

            return historyModels;
        }
    }

    public HistoryModel CreateHistory(HistoryModel model)
    {
        const string sql =
            "INSERT INTO history(useremail, unitId, date, eventtype) VALUES(@UserEmail, @unitid, @date, @EventTypeId) RETURNING *";
        using (var conn = _dataSource.OpenConnection())
        {
            var response = conn.QueryFirst<HistoryModel>(sql,
                new { model.UserEmail, model.Unit.UnitId, model.Date, model.EventTypeId });
            return response;
        }
    }
}