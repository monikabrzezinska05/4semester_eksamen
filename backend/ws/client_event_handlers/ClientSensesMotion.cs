using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientSensesMotionDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
}

public class ClientSensesMotion : BaseEventHandler<ClientSensesMotionDto>
{
    private readonly HistoryService _historyService;

    public ClientSensesMotion(HistoryService historyService)
    {
        _historyService = historyService;
    }

    public override Task Handle(ClientSensesMotionDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var sensingMotionHistory = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var sensingMotionHistoryToClient = JsonSerializer.Serialize(new ServerSensesMotion()
        {
            ResponseDto = sensingMotionHistory
        });
        socket.Send(sensingMotionHistoryToClient);
        return Task.CompletedTask;
    }
}