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
    public static Dictionary<Guid, WsWithMetadata> Clients = new();
    public static Dictionary<Guid, IWebSocketConnection> Connections = new();

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
        Clients.Remove(clientId);
    }
    
    public static bool AddConnection(IWebSocketConnection ws)
    {
        return Connections.TryAdd(ws.ConnectionInfo.Id, ws);
    }
    
    public static bool RemoveConnection(IWebSocketConnection ws)
    {
        return Connections.Remove(ws.ConnectionInfo.Id);
    }
}