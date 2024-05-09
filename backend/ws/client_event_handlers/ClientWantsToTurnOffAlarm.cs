using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToTurnOffAlarmDto: BaseDto
{
    public HistoryModel historyModel { get; set; }
}

public class ClientWantsToTurnOffAlarm : BaseEventHandler<ClientWantsToTurnOffAlarmDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTPublishService _mqttPublishService;

    public ClientWantsToTurnOffAlarm(HistoryService historyService, MQTTPublishService mqttPublishService)
    {
        _historyService = historyService;
        _mqttPublishService = mqttPublishService;
    }

    public override async Task Handle(ClientWantsToTurnOffAlarmDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        await _mqttPublishService.AlarmTurnOffPublish();
        var turnOffAlarm = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var turnOffAlarmToClient = JsonSerializer.Serialize(new ServerHasDeactivatedAlarm()
        {
            ResponseDto = turnOffAlarm
        });
        await socket.Send(turnOffAlarmToClient);
    }
}