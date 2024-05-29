using Dapper;
using infrastructure.models;
using Npgsql;

namespace infrastructure.repositories;

public class AuthenticateRepository
{
    private NpgsqlDataSource _dataSource;
    public AuthenticateRepository(NpgsqlDataSource dataSource)
    {
        _dataSource = dataSource;
    }

    public PasswordModel? GetUserByEmail(string userEmail)
    {
        const string sql = "SELECT passwords.useremail, passwords.password, passwords.salt " +
                           "FROM public.passwords " +
                           "JOIN public.\"User\" ON passwords.useremail = \"User\".mail " +
                           "WHERE public.\"User\".mail = @userEmail;";
        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirst<PasswordModel?>(sql, new {userEmail});
        }
    }
}