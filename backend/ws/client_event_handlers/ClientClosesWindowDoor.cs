using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;

namespace ws;

public class ClientClosesWindowDoorDto : BaseDto
{
    public HistoryModel HistoryModel { get; set; }
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
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
        var windowDoorHistory = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var windowdoorHistoryToClient = JsonSerializer.Serialize(windowDoorHistory);
        socket.Send(windowdoorHistoryToClient);
        return Task.CompletedTask;
    }
}