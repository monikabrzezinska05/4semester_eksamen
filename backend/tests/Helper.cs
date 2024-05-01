namespace tests;

public static class Helper
{
    public static readonly Uri Uri;
    public static readonly string ProperlyFormattedConnectionString;
    public static readonly NpgsqlDataSource DataSource;


    static Helper()
    {
        string rawConnectionString;
        string envVarKeyName = "pgconn";

        rawConnectionString = Environment.GetEnvironmentVariable(envVarKeyName)!;
        if (rawConnectionString == null)
        {
            throw new Exception("Empty pgconn");
        }

        try
        {
            Uri = new Uri(rawConnectionString);
            ProperlyFormattedConnectionString = string.Format(
                "Server={0};Database={1};User Id={2};Password={3};Port={4};Pooling=true;MaxPoolSize=3",
                Uri.Host,
                Uri.AbsolutePath.Trim('/'),
                Uri.UserInfo.Split(':')[0],
                Uri.UserInfo.Split(':')[1],
                Uri.Port > 0 ? Uri.Port : 5432);
            DataSource =
                new NpgsqlDataSourceBuilder(ProperlyFormattedConnectionString).Build();
            DataSource.OpenConnection().Close();
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);
        }
    }

    public static void TriggerRebuild()
    {
        using (var conn = DataSource.OpenConnection())
        {
            conn.Execute(RebuildScript);
        }
    }