using System.Net.Sockets;
using System.Reflection;
using System.Text.Json;
using Fleck;
using infrastructure;
using infrastructure.repositories;
using lib;
using service;
using service.PasswordHashing;

namespace api;

public static class Startup
{
    public static void Main(string[] args)
    {
        Statup(args);
        Console.ReadLine();
    }

    public static void Statup(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        
        builder.Services.AddNpgsqlDataSource(Utilities.connectionString,
            dataSourceBuilder => dataSourceBuilder.EnableParameterLogging());
        
        builder.Services.AddSingleton<HistoryRepo>();
        builder.Services.AddSingleton<AuthenticateRepository>();
        builder.Services.AddSingleton<UserRepository>();
        builder.Services.AddSingleton<EmailRepository>();
        builder.Services.AddSingleton<UnitRepository>();
        
        builder.Services.AddSingleton<MQTTService>();
        
        builder.Services.AddSingleton<HistoryService>();
        builder.Services.AddSingleton<AuthenticationService>();
        builder.Services.AddSingleton<UserService>();
        builder.Services.AddSingleton<EmailService>();
        builder.Services.AddSingleton<UnitService>();
        builder.Services.AddSingleton<HashingArgon2id>();
        builder.Services.AddHttpClient();

        var clientEventHandlers = builder.FindAndInjectClientEventHandlers(Assembly.GetExecutingAssembly());

        var app = builder.Build();

        var server = new WebSocketServer("ws://0.0.0.0:8181");

        server.Start(ws =>
        {
            ws.OnClose = () => { StateService.RemoveConnection(ws); };

            ws.OnOpen = async () =>
            {
                try
                {
                    Console.WriteLine("Client connected");
                    StateService.AddConnection(ws);
                }
                catch (Exception e)
                {
                    GlobalExceptionHandler.Handle(e, ws, "fix this");
                }
            };

            ws.OnMessage = async message =>
            {
                try
                {
                    await app.InvokeClientEventHandler(clientEventHandlers, ws, message);
                }
                catch (Exception e)
                {
                    GlobalExceptionHandler.Handle(e, ws, message);
                }
            };
        });
        app.Services.GetService<MQTTService>().CommunicateWithBroker();
    }
}