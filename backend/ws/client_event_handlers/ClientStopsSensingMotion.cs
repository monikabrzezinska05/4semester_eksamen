using System.Text.Json;
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
    private readonly UnitService _unitService;

    public ClientStopsSensingMotion(HistoryService historyService, UnitService unitService)
    {
        _unitService = unitService;
        _historyService = historyService;
    }

    public override Task Handle(ClientStopsSensingMotionDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var unit = _unitService.SetUnitStatus(dto.historyModel.UnitId, Status.Disarmed);
        var response = JsonSerializer.Serialize(new ServerStopsSendingMotion()
        {
            History = loggedEvent,
            Unit = unit
        }, StateService.JsonOptions());
        socket.Send(response);
        return Task.CompletedTask;
    }
}