using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientClosesWindowDoorDto : BaseDto
{
    public HistoryModel HistoryModel { get; set; }
    public Unit unit { get; set; }
}

public class ClientClosesWindowDoor : BaseEventHandler<ClientClosesWindowDoorDto>
{
    private readonly HistoryService _historyService;

    public ClientClosesWindowDoor(HistoryService historyService)
    {
        _historyService = historyService;
    }

    public override Task Handle(ClientClosesWindowDoorDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);

        var windowDoorHistoryToClient = JsonSerializer.Serialize(new ServerClosesWindowDoor()
            {
                History = loggedEvent,
                Unit = dto.unit
            },
            StateService.JsonOptions()
        );
        socket.Send(windowDoorHistoryToClient);
        return Task.CompletedTask;
    }
}