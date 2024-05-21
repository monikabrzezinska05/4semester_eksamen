using System.Runtime.InteropServices.ComTypes;
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

    public List<HistoryModel> GetHistory(DateTime? timePeriod)
    {
        string sql = "";
        string sqlGetUnit = "SELECT * FROM unit WHERE unitid IN (@unitid)";
        if (timePeriod != null)
        {
            sql =
                "SELECT historyid, unitid, \"User\".name, eventtype, date\n" +
                "FROM history\n" +
                "LEFT JOIN public.\"User\" on \"User\".mail = history.useremail WHERE history.date > @timePeriod";
        }
        else
        {
            sql = "SELECT historyid, " +
                  "json_agg(json_build_object('unitid', u.unitid, 'name', u.name, 'unittype', u.unittype, 'status', u.status)) as \"UnitTable\", " +
                  "\"User\".name, " +
                  "eventtype, " +
                  "date " +
                  "FROM history " +
                  "JOIN public.unit u on u.unitid = history.unitid " +
                  "LEFT JOIN public.\"User\" on \"User\".mail = history.useremail " +
                  "group by historyid, \"User\".name, eventtype, date";
        }

        using (var conn = _dataSource.OpenConnection())
        {
            return conn.Query<HistoryModel>(sql).ToList();
        }
    }

    public HistoryModel CreateHistory(HistoryModel model)
    {
        const string sql =
            "INSERT INTO history(useremail, unitId, date, eventtype) VALUES(@UserEmail, @unitid, @date, @EventTypeId) RETURNING *";
        const string sqlGetter = "SELECT historyid, " +
        "json_agg(json_build_object('unitid', u.unitid, 'name', u.name, 'unittype', u.unittype, 'status', u.status)) as \"UnitTable\", " +
            "\"User\".name, " +
            "eventtype, " +
            "date " +
            "FROM history " +
            "JOIN public.unit u on u.unitid = history.unitid " +
            "LEFT JOIN public.\"User\" on \"User\".mail = history.useremail " +
            "WHERE historyid = @HistoryId" +
            "group by historyid, \"User\".name, eventtype, date";
        using (var conn = _dataSource.OpenConnection())
        {
            Console.WriteLine("kig her: " + model);
            var newHistory = conn.QueryFirst<HistoryModel>(sql,
                new { UserEmail = model.PersonName, model.UnitId, model.Date, EventTypeId = model.EventType });
            var response = conn.QueryFirst<HistoryModel>(sqlGetter, new { newHistory.HistoryId });
            return response;
        }
    }
}