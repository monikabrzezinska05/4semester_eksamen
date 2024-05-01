using Dapper;
using Npgsql;

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

    public static string RebuildScript = @"
DROP SCHEMA IF EXISTS postgrestest CASCADE;
CREATE SCHEMA postgres;

-- Create EventType table
CREATE TABLE EventType (
    EventTypeId SERIAL PRIMARY KEY,
    Name VARCHAR(20)
);

-- Create UnitType table
CREATE TABLE UnitType (
    UnitTypeId SERIAL PRIMARY KEY,
    Name VARCHAR(15)
);

-- Create User table
CREATE TABLE 'User' (
    UserId SERIAL PRIMARY KEY,
    Name VARCHAR(30),
    Mail VARCHAR(50),
    Child BOOLEAN
);

-- Create Passwords table
CREATE TABLE Passwords (
    UserId SERIAL REFERENCES 'User'(UserId),
    Password VARCHAR(255),
    Salt VARCHAR(255),
    PRIMARY KEY (UserId)
);

-- Create Unit table
CREATE TABLE Unit (
    UnitId SERIAL PRIMARY KEY,
    Name VARCHAR(60),
    Status BOOLEAN,
    UnitTypeId SERIAL REFERENCES UnitType(UnitTypeId)
);

-- Create History table
CREATE TABLE History (
    HistoryId SERIAL PRIMARY KEY,
    UnitId SERIAL REFERENCES Unit(UnitId),
    Date DATE,
    UserId SERIAL REFERENCES 'User'(UserId),
    EventTypeId SERIAL REFERENCES EventType(EventTypeId)
);";
}