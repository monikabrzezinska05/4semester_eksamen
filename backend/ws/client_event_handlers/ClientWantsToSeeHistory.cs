using Fleck;
using lib;
using service;

namespace ws;

public class ClientWantsToSeeHistoryDto: BaseDto
{
    
}

public class ClientWantsToSeeHistory : BaseEventHandler<ClientWantsToSeeHistoryDto>
{
    private readonly HistoryService _historyService;

    public ClientWantsToSeeHistory(HistoryService historyService)
    {
        _historyService = historyService;
    }
    public override Task Handle(ClientWantsToSeeHistoryDto dto, IWebSocketConnection socket)
    {
        var server = new WebSocketServer("42069")
    }
}