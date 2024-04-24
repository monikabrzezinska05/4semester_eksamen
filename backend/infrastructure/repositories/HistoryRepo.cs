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

    public HistoryModel GetHistory()
    {
        const string sql = "SELECT * FROM history";

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirst<HistoryModel>(sql);
        }
    }

    public HistoryModel CreateHistory(HistoryModel model)
    {
        const string sql = "INSERT INTO history(userId, unitId, date, eventType) VALUES(@userId, @unitid, @date, @eventType)";
        using (var conn = _dataSource.OpenConnection())
        {
            var response = conn.QueryFirst<HistoryModel>(sql, new {model.UserId, model.UnitId, model.Date, model.EventTypeId});
            return response;
        }
    }
}