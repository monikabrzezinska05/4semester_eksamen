using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientTriggersAlarmDto : BaseDto
{
    public HistoryModel HistoryModel { get; set; }

}
public class ClientTriggersAlarm : BaseEventHandler<ClientTriggersAlarmDto>
{
    private readonly HistoryService _historyService;
    private readonly UnitService _unitService;
    private readonly EmailService _emailService;

    public ClientTriggersAlarm(HistoryService historyService, UnitService unitService, EmailService emailService)
    {
        _historyService = historyService;
        _unitService = unitService;
        _emailService = emailService;
    }

    public override Task Handle(ClientTriggersAlarmDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        var unitId = dto.HistoryModel.UnitId;
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
        Unit unit = _unitService.SetUnitStatus(unitId, Status.Triggered);
        _emailService.SendEmail(loggedEvent, unit);
        var response = new ServerAlarmTriggered()
        {
            History = loggedEvent,
            Unit = unit
        };
        var alarmTriggerToClient = JsonSerializer.Serialize(response, StateService.JsonOptions());
        socket.Send(alarmTriggerToClient);
        return Task.CompletedTask;
    }
}