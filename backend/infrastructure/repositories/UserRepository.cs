using Dapper;
using infrastructure.models;
using Npgsql;

namespace infrastructure.repositories;

public class UserRepository
{
    private NpgsqlDataSource _dataSource;
    
    public UserRepository(NpgsqlDataSource dataSource)
    {
        _dataSource = dataSource;
    }
    
    public User? GetUserById(int pwHashUserId)
    {
        const string sql = "SELECT * FROM public.\"User\" WHERE UserID = @pwHashUserId;";
        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirstOrDefault<User>(sql, new {pwHashUserId});
        }
    }
}