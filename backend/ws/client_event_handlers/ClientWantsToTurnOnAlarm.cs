using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using Org.BouncyCastle.Asn1.Ocsp;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToTurnOnAlarmDto: BaseDto
{
    public HistoryModel HistoryModel { get; set; }
}

public class ClientWantsToTurnOnAlarm : BaseEventHandler<ClientWantsToTurnOnAlarmDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTPublishService _mqttPublishService;

    public ClientWantsToTurnOnAlarm(HistoryService historyService, MQTTPublishService mqttPublishService)
    {
        _historyService = historyService;
        _mqttPublishService = mqttPublishService;
    }

    public override async Task Handle(ClientWantsToTurnOnAlarmDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
        await _mqttPublishService.AlarmTurnOnPublish();
        var turnOnAlarm = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var turnOnAlarmToClient = JsonSerializer.Serialize(new ServerHasActivatedAlarm()
        {
            ResponseDto = turnOnAlarm
        });
        await socket.Send(turnOnAlarmToClient);
    }
}