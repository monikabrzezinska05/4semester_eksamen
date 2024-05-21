using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientLocksDoorDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
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
        var lockDoorHistory = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var lockDoorHistoryToClient = JsonSerializer.Serialize(new ServerLocksDoor()
        {
            ResponseDto = lockDoorHistory
        });
        socket.Send(lockDoorHistoryToClient);
        return Task.CompletedTask;
    }
}