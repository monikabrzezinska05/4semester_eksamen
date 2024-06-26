﻿using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToTurnOnAlarmsWindowDoorDto : BaseDto
{
    public HistoryModel HistoryModel { get; set; }
}

public class ClientWantsToTurnOnMotionAlarm : BaseEventHandler<ClientWantsToTurnOnAlarmsWindowDoorDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTPublishService _mqttPublishService;
    private readonly UnitService _unitService;

    public ClientWantsToTurnOnMotionAlarm(HistoryService historyService, MQTTPublishService mqttPublishService, UnitService unitService)
    {
        _historyService = historyService;
        _mqttPublishService = mqttPublishService;
        _unitService = unitService;
    }

    public override async Task Handle(ClientWantsToTurnOnAlarmsWindowDoorDto dto, IWebSocketConnection socket)
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
        _unitService.SetMotionSensorStatus(Status.Armed);
        await _mqttPublishService.AlarmTurnOnMotionPublish();
        
        var turnOffAlarmToClient = JsonSerializer.Serialize(new ServerHasActivatedMotionSensorAlarm()
        {
            History = loggedEvents
        });
        await socket.Send(turnOffAlarmToClient);
    }
}