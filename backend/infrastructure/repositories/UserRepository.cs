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
    
    public void CreatePassword(string hash, string salt, int? userId)
    {
        var sql = "INSERT INTO public.passwords " +
                  "(userid, password,salt) " +
                  "VALUES (@userId, @hash, @salt)";
        using (var conn = _dataSource.OpenConnection())
        {
            conn.Execute(sql, new {userId, hash, salt});
        }
    }

    public User CreateUser(User user)
    {
        var sql = "INSERT INTO public.\"User\"" +
                  "(name, mail, child)" +
                  "VALUES (@name, @mail, @isChild) " +
                  "ON CONFLICT(mail) DO NOTHING " +
                  "RETURNING *;";

        using (var conn = _dataSource.OpenConnection())
        {
            var response = conn.QueryFirst<User?>(sql, new {user.name, user.email, user.isChild});
            if (response == null)
            {
                throw new Exception("User already exists");
            }
            return response;
        }
    }
}