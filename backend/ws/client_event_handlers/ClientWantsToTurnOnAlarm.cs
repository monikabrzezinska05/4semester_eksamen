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
    public HistoryModel historyModel { get; set; }
}

public class ClientWantsToTurnOnAlarm : BaseEventHandler<ClientWantsToTurnOnAlarmDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTPublishService _mqttPublishService;
    private readonly UnitService _unitService;

    public ClientWantsToTurnOnAlarm(HistoryService historyService, MQTTPublishService mqttPublishService, UnitService unitService)
    {
        _historyService = historyService;
        _mqttPublishService = mqttPublishService;
        _unitService = unitService;
    }

    public override async Task Handle(ClientWantsToTurnOnAlarmDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        _unitService.SetUnitStatus(dto.historyModel.UnitId, Status.Armed);
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