namespace infrastructure;

public class Utilities
{
    private static readonly string DBPassword = new(Environment.GetEnvironmentVariable("PGCONN"));
    public static readonly string connectionString = "Server=144.91.64.53:42069;Database=postgres;User Id=dan;Password=" + DBPassword + ";";

}
