using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;

namespace ws.client_event_handlers;

public class ClientWantsToSeeHistoryDto: BaseDto
{
    public List<HistoryModel> historyRecords { get; set; }
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
        var history = new ResponseDto()
        {
            ResponseData = dto.historyRecords
        };
        var historyToClient = JsonSerializer.Serialize(history);
        socket.Send(historyToClient);
        return Task.CompletedTask;
    }
}