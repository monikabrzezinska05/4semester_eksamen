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
    
    public User? GetUserByMail(string pwHashMail)
    {
        const string sql = "SELECT * FROM public.\"User\" WHERE mail = @pwHashMail;";
        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirstOrDefault<User>(sql, new {pwHashMail});
        }
    }
    
    public void CreatePassword(string hash, string salt, string mail)
    {
        var sql = "INSERT INTO public.passwords " +
                  "(useremail, password,salt) " +
                  "VALUES (@mail, @hash, @salt)";
        using (var conn = _dataSource.OpenConnection())
        {
            conn.Execute(sql, new {mail, hash, salt});
        }
    }

    public User CreateUser(User user)
    {
        Console.WriteLine("user: " + user.Name + " " + user.Mail + " " + user.IsChild);
        var sql = "INSERT INTO public.\"User\"" +
                  "(name, mail, child)" +
                  "VALUES (@name, @mail, @isChild) " +
                  "ON CONFLICT(mail) DO NOTHING " +
                  "RETURNING *;";

        using (var conn = _dataSource.OpenConnection())
        {
            
            var response = conn.QueryFirst<User?>(sql, new {user.Name, user.Mail, user.IsChild});
            if (response == null)
            {
                throw new Exception("User already exists");
            }
            return response;
        }
    }

    public User GetUser(string mail)
    {
        var sql = "SELECT * FROM public.\"User\" WHERE mail = @mail;";
        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirstOrDefault<User>(sql, new {mail});
        }
    }
}