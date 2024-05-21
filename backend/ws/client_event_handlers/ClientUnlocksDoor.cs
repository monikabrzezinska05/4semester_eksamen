using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientUnlocksDoorDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
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
        var unlockDoorHistory = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var unlockDoorHistoryToClient = JsonSerializer.Serialize(new ServerUnlocksDoor()
            {
                ResponseDto = unlockDoorHistory
            });
        socket.Send(unlockDoorHistoryToClient);
        return Task.CompletedTask;
    }
}