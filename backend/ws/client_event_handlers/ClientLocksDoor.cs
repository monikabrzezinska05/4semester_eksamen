using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientLocksDoorDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
    public Unit unit { get; set; }
}

public class ClientLocksDoor : BaseEventHandler<ClientLocksDoorDto>
{
    private readonly HistoryService _historyService;

    public ClientLocksDoor(HistoryService historyService)
    {
        _historyService = historyService;
    }

    public override Task Handle(ClientLocksDoorDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var lockDoorHistoryToClient = JsonSerializer.Serialize(new ServerLocksDoor()
        {
            History = loggedEvent,
            Unit = dto.unit
        }, StateService.JsonOptions());
        socket.Send(lockDoorHistoryToClient);
        return Task.CompletedTask;
    }
}