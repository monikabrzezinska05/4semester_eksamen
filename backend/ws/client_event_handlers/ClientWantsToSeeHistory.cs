using System.Text.Json;
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
        //StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        List<HistoryModel> theCompleteHistory = _historyService.GetHistory(dto.TimePeriod);

        var historyToClient = JsonSerializer.Serialize(new ServerShowsHistory()
        {
            HistoryList = theCompleteHistory
        }, StateService.JsonOptions());
        
        socket.Send(historyToClient);

        return Task.CompletedTask;
    }
}