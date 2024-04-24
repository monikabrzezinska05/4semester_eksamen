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
}