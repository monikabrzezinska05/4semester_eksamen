using Fleck;

namespace service;

public static class StateService
{
    public static Dictionary<Guid, IWebSocketConnection> Connections = new();

    public static bool AddConnection(IWebSocketConnection ws)
    {
        return Connections.TryAdd(ws.ConnectionInfo.Id, ws);
    }


    public static bool RemoveConnection(IWebSocketConnection ws)
    {
        return Connections.Remove(ws.ConnectionInfo.Id);
    }
}