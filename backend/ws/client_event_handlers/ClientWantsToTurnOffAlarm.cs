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
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        _unitService.SetUnitStatus(dto.historyModel.UnitId, Status.Disarmed);
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