using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientStopsSensingMotionDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
}

public class ClientStopsSensingMotion : BaseEventHandler<ClientStopsSensingMotionDto>
{
    private readonly HistoryService _historyService;

    public ClientStopsSensingMotion(HistoryService historyService)
    {
        _historyService = historyService;
    }

    public override Task Handle(ClientStopsSensingMotionDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var stopsSensingMotionHistory = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var stopsSensingMotionHistoryToClient = JsonSerializer.Serialize(new ServerStopsSendingMotion()
        {
            ResponseDto = stopsSensingMotionHistory
        });
        socket.Send(stopsSensingMotionHistoryToClient);
        return Task.CompletedTask;
    }
}