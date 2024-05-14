
using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToSeeHistoryDto: BaseDto
{
    public DateTime? TimePeriod { get; set; }
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
        List<HistoryModel> theCompleteHistory = _historyService.GetHistory(dto.TimePeriod);
        var history = new ResponseDto()
        {
            ResponseData = theCompleteHistory
        };
        
        var historyToClient = JsonSerializer.Serialize(new ServerShowsHistory()
        {
            ResponseDto = history
        }, StateService.JsonOptions());
        socket.Send(historyToClient);
        return Task.CompletedTask;
    }
}