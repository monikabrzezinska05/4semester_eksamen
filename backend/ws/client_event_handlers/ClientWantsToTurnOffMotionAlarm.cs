using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToTurnOffAlarmsWindowDoorDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
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
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        _unitService.SetAllWindowDoorStatus((int)Status.Disarmed);
        await _mqttPublishService.AlarmTurnOffMotionPublish();
        var turnOffAlarm = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var turnOffAlarmToClient = JsonSerializer.Serialize(new ServerHasDeactivatedWindowDoorAlarm()
        {
            ResponseDto = turnOffAlarm
        });
        await socket.Send(turnOffAlarmToClient);
    }
}