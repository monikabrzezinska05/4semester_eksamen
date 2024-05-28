﻿using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToTurnOffAlarmDto: BaseDto
{
    public HistoryModel HistoryModel { get; set; }
}

public class ClientWantsToTurnOffAlarm : BaseEventHandler<ClientWantsToTurnOffAlarmDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTPublishService _mqttPublishService;
    private readonly UnitService _unitService;

    public ClientWantsToTurnOffAlarm(HistoryService historyService, MQTTPublishService mqttPublishService, UnitService unitService)
    {
        _historyService = historyService;
        _mqttPublishService = mqttPublishService;
        _unitService = unitService;
    }

    public override async Task Handle(ClientWantsToTurnOffAlarmDto dto, IWebSocketConnection socket)
    {
        
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
        _unitService.SetAllWindowDoorStatus(Status.Disarmed);
        await _mqttPublishService.AlarmTurnOffPublish();

        var turnOffAlarmToClient = JsonSerializer.Serialize(new ServerHasDeactivatedAlarm()
        {
            History = loggedEvent
        }, StateService.JsonOptions());
        await socket.Send(turnOffAlarmToClient);
    }
}