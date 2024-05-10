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

    public Unit GetUnitById(int unitId)
    {
        string sql = "SELECT * FROM unit WHERE unitId = @UnitId;";

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirst<Unit>(sql, new {unitId});
        }
    }

    public List<Unit> GetAllUnits()
    {
        string sql = "SELECT * FROM unit;";
        
        using (var conn = _dataSource.OpenConnection())
        {
            return conn.Query<Unit>(sql).ToList();
        }
    }

    public Unit SetUnitStatus(int unitId, int status)
    {
        string sql = "UPDATE unit SET status = @status WHERE unitid = @unitId;";

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.QueryFirst<Unit>(sql, new {@unitId, @status});
        }
    }

    public List<Unit> SetAllUnitStatus(int status)
    {
        string sql = "UPDATE unit SET status = @status;";

        using (var conn = _dataSource.OpenConnection())
        { 
            return conn.Query<Unit>(sql, new {@status}).ToList();
        }
    }

    public List<Unit> SetAllWindowDoorStatus(int status)
    {
        string sql = "UPDATE unit SET status = @status WHERE unittype != 2;";

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.Query<Unit>(sql, new { @status }).ToList();
        }
    }

    public List<Unit> SetAllSpecificUnitStatus(int status, int type)
    {
        string sql = "UPDATE unit SET status = @status WHERE unittype = @type;";

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.Query<Unit>(sql, new { @status, @type }).ToList();
        }
    }
}