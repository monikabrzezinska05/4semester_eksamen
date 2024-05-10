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

    public EmailModel createEmail(EmailModel model)
    {
        const string sql = "INSERT INTO emaillist(id, mail) VALUES(@Id, @Mail) RETURNING *";
        using (var conn = _dataSource.OpenConnection())
        {
            var response = conn.QueryFirst<EmailModel>(sql, new { model.id, model.mail });
            return response;
        }
    }

    public bool deleteEmail(int id)
    {
        const string sql = "DELETE FROM emaillist WHERE id = @id";
        using (var conn = _dataSource.OpenConnection())
        {
            var response = conn.Execute(sql, new {id}) == 1;
            return response;
        }
    }
}