using Dapper;
using infrastructure.models;
using Npgsql;

namespace infrastructure.repositories;

public class UnitRepository
{
    private NpgsqlDataSource _dataSource;
    public UnitRepository(NpgsqlDataSource dataSource)
    {
        _dataSource = dataSource;
    }

    public Unit getUnitById(int unitId)
    {
        string sql = "SELECT * FROM unit WHERE unitId =@UnitId";

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirst<Unit>(sql, new {unitId});
        }
    }
}