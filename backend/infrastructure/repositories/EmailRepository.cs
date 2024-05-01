using Dapper;
using infrastructure.models;
using Npgsql;

namespace infrastructure.repositories;

public class EmailRepository
{
    private NpgsqlDataSource _dataSource;

    public EmailRepository(NpgsqlDataSource dataSource)
    {
        _dataSource = dataSource;
    }

    public IEnumerable<EmailModel> getMails()
    {
        var sql = "SELECT * FROM emaillist";
        using (var conn = _dataSource.OpenConnection())
        {
            return conn.Query<EmailModel>(sql);
        }
    }
}