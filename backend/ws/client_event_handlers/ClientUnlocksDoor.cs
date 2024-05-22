using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientUnlocksDoorDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
    public Unit unit { get; set; }
}

public class ClientUnlocksDoor : BaseEventHandler<ClientUnlocksDoorDto>
{
    private readonly HistoryService _historyService;

    public ClientUnlocksDoor(HistoryService historyService)
    {
        _historyService = historyService;
    }

    public override Task Handle(ClientUnlocksDoorDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var unlockDoorHistoryToClient = JsonSerializer.Serialize(new ServerUnlocksDoor()
            {
                History = loggedEvent,
                Unit = dto.unit
            }, StateService.JsonOptions());
        socket.Send(unlockDoorHistoryToClient);
        return Task.CompletedTask;
    }
}