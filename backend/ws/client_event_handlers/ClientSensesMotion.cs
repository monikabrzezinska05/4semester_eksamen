using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientSensesMotionDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
    public Unit unit { get; set; }
}

public class ClientSensesMotion : BaseEventHandler<ClientSensesMotionDto>
{
    private readonly HistoryService _historyService;
    private readonly UnitService _unitService;

    public ClientSensesMotion(HistoryService historyService, UnitService unitService)
    {
        _unitService = unitService;
        _historyService = historyService;
    }

    public override Task Handle(ClientSensesMotionDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var unit = _unitService.SetUnitStatus(dto.historyModel.UnitId, Status.Armed);
        var response = JsonSerializer.Serialize(new ServerSensesMotion()
        {
            History = loggedEvent,
            Unit = unit
        }, StateService.JsonOptions());
        socket.Send(response);
        return Task.CompletedTask;
    }
}