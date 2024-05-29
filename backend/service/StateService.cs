using System.Collections.Concurrent;
using System.Text.Json;
using System.Security.Authentication;
using Fleck;
using infrastructure.models;

namespace service;

public class WsWithMetadata(IWebSocketConnection connection)
{
    public IWebSocketConnection Connection { get; set; } = connection;
    public bool IsAuthenticated { get; set; } = false;
    public User user { get; set; }
}

public static class StateService
{
    public static ConcurrentDictionary<Guid, WsWithMetadata> Clients = new();
    public static ConcurrentDictionary<Guid, IWebSocketConnection> Connections = new();
    public static List<string> NotificationTokens { get; set; } = new();

    public static WsWithMetadata GetClient(Guid clientId)
    {
        return Clients[clientId];
    }

    public static void IsClientAuthenticated(Guid clientId)
    {
        if (!Clients[clientId].IsAuthenticated)
        {
            throw new AuthenticationException("Client is not authenticated");
        }
    }
    
    public static void AddClient(Guid clientId, IWebSocketConnection connection)
    {
        Clients.TryAdd(clientId, new WsWithMetadata(connection));
    }

    public static void RemoveClient(Guid clientId)
    {
        Clients.Remove(clientId, out _);
    }
    
    public static bool AddConnection(IWebSocketConnection ws)
    {
        return Connections.TryAdd(ws.ConnectionInfo.Id, ws);
    }
    
    public static bool RemoveConnection(IWebSocketConnection ws)
    {
        return Connections.Remove(ws.ConnectionInfo.Id, out _);
    }
    
    public static JsonSerializerOptions JsonOptions()
    {
        return new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };
    }

    public static void SendToAll(string dtoResult)
    {
        foreach (var connection in Connections.Values)
        {
            connection.Send(dtoResult);
        }
    }

    public static List<string> GetNotificationTokens()
    {
        return NotificationTokens;
    }

    public static void AddNotificationToken(string dtoToken)
    {
        if (!NotificationTokens.Contains(dtoToken))
        {
            NotificationTokens.Add(dtoToken);
        }
    }
}