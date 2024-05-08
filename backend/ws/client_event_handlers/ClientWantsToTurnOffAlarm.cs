using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;

namespace ws;

public class ClientWantsToTurnOffAlarmDto: BaseDto
{
    public HistoryModel historyModel { get; set; }
}

public class ClientWantsToTurnOffAlarm : BaseEventHandler<ClientWantsToTurnOffAlarmDto>
{
    private readonly HistoryService _historyService;
    private readonly MQTTService _mqttService;

    public ClientWantsToTurnOffAlarm(HistoryService historyService, MQTTService mqttService)
    {
        _historyService = historyService;
        _mqttService = mqttService;
    }

    public override Task Handle(ClientWantsToTurnOffAlarmDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.historyModel);
        var turnOffAlarm = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var turnOffAlarmToClient = JsonSerializer.Serialize(turnOffAlarm);
        socket.Send(turnOffAlarmToClient);
        return Task.CompletedTask;
    }
}