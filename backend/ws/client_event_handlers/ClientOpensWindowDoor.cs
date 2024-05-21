using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientOpensWindowDoorDto: BaseDto
{
    public HistoryModel HistoryModel { get; set; }
    public Unit Unit { get; set; }
}

public class ClientOpensWindowDoor : BaseEventHandler<ClientOpensWindowDoorDto>
{
    private readonly HistoryService _historyService;

    public ClientOpensWindowDoor(HistoryService historyService)
    {
        _historyService = historyService;
    }
    public override Task Handle(ClientOpensWindowDoorDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);

        var windowDoorHistoryToClient = JsonSerializer.Serialize(new ServerOpensWindowDoor()
        {
            History = loggedEvent,
            Unit = dto.Unit
        }, StateService.JsonOptions());
        socket.Send(windowDoorHistoryToClient);
        return Task.CompletedTask;
    }
}