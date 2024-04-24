using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;

namespace ws;

public class ClientOpensWindowDoorDto: BaseDto
{
    public HistoryModel historyModel { get; set; }
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
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var windowDoorHistory = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var windowDoorHistoryToClient = JsonSerializer.Serialize(windowDoorHistory);
        socket.Send(windowDoorHistoryToClient);
        return Task.CompletedTask;
    }
}