using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToTurnOffAlarmsWindowDoorDto : BaseDto
{
    public HistoryModel HistoryModel { get; set; }
}

public class ClientWantsToTurnOffMotionAlarm : BaseEventHandler<ClientWantsToTurnOffAlarmsWindowDoorDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTPublishService _mqttPublishService;
    private readonly UnitService _unitService;

    public ClientWantsToTurnOffMotionAlarm(HistoryService historyService, MQTTPublishService mqttPublishService, UnitService unitService)
    {
        _historyService = historyService;
        _mqttPublishService = mqttPublishService;
        _unitService = unitService;
    }


    public override async Task Handle(ClientWantsToTurnOffAlarmsWindowDoorDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        var loggedEvents = new List<HistoryModel>();
        var units = _unitService.GetAllUnits();
        var unitsToUpdate = units.Where(u => u.UnitType == UnitType.MotionSensor).ToList();
        foreach (var unit in unitsToUpdate)
        {
            dto.HistoryModel.UnitId = unit.UnitId;
            HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
            loggedEvents.Add(loggedEvent);
        }
        _unitService.SetMotionSensorStatus(Status.Disarmed);
        await _mqttPublishService.AlarmTurnOnMotionPublish();

        var turnOffAlarmToClient = JsonSerializer.Serialize(new ServerHasDeactivatedMotionSensorAlarm()
        {
            History = loggedEvents
        }, StateService.JsonOptions());
        await socket.Send(turnOffAlarmToClient);
    }
}