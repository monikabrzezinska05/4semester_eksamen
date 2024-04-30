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
            sql = "SELECT * FROM history WHERE history.date > @timePeriod";
        }
        else
        {
            sql = "SELECT * FROM history";
        }

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.Query<HistoryModel>(sql).ToList();
        }
    }

    public HistoryModel CreateHistory(HistoryModel model)
    {
        Console.WriteLine("history repo");
        const string sql = "INSERT INTO history(useremail, unitId, date, eventtype) VALUES(@UserEmail, @unitid, @date, @EventTypeId) RETURNING *";
        using (var conn = _dataSource.OpenConnection())
        {
            var response = conn.QueryFirst<HistoryModel>(sql, new {model.UserEmail, model.UnitId, model.Date, model.EventTypeId});
            return response;
        }
    }
}