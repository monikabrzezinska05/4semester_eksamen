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
        if (timePeriod != null)
        {
            sql =
                "SELECT historyid, CONCAT(u.unitid, u.name, u.unittype, u.status) as \"Unit\", \"User\".name, eventtype, date\n" +
                "FROM history\n" +
                "JOIN public.unit u on u.unitid = history.unitid\n " +
                "LEFT JOIN public.\"User\" on \"User\".mail = history.useremail WHERE history.date > @timePeriod";
        }
        else
        {
            sql =
                "SELECT historyid, CONCAT(u.unitid, u.name, u.unittype, u.status) as \"Unit\", \"User\".name, eventtype, date\n" +
                "FROM history\n" +
                "JOIN public.unit u on u.unitid = history.unitid\n " +
                "LEFT JOIN public.\"User\" on \"User\".mail = history.useremail";
        }

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.Query<HistoryModel>(sql).ToList();
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