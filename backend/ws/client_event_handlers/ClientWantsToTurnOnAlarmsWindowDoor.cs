using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToTurnOnAlarmsWindowDoorDto : BaseDto
{
    public HistoryModel historyModel { get; set; }
}

public class ClientWantsToTurnOnAlarmsWindowDoor : BaseEventHandler<ClientWantsToTurnOnAlarmsWindowDoorDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTPublishService _mqttPublishService;
    private readonly UnitService _unitService;

    public ClientWantsToTurnOnAlarmsWindowDoor(HistoryService historyService, MQTTPublishService mqttPublishService, UnitService unitService)
    {
        _historyService = historyService;
        _mqttPublishService = mqttPublishService;
        _unitService = unitService;
    }


    public override async Task Handle(ClientWantsToTurnOnAlarmsWindowDoorDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        _unitService.SetAllWindowDoorStatus((int)Status.Armed);
        await _mqttPublishService.AlarmTurnOnWindowDoorPublish();
        var turnOnAlarm = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var turnOffAlarmToClient = JsonSerializer.Serialize(new ServerHasActivatedWindowDoorAlarm()
        {
            ResponseDto = turnOnAlarm
        });
        await socket.Send(turnOffAlarmToClient);
    }
}