using System.Security.Authentication;
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
        //StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        List<HistoryModel> theCompleteHistory = _historyService.GetHistory(dto.TimePeriod);
        var history = new ResponseDto()
        {
            ResponseData = theCompleteHistory
        };
        var option = new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };
        var response = JsonSerializer.Serialize(new ServerShowsHistory()
        {
            HistoryList = theCompleteHistory
        }, option);
        var historyToClient = JsonSerializer.Serialize(response);
        socket.Send(response);
        return Task.CompletedTask;
    }
}