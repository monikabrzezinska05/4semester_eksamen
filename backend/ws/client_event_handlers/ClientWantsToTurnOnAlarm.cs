using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
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
        var loggedEvents = new List<HistoryModel>();
        var units = _unitService.GetAllUnits();
        var unitsToUpdate = units.Where(u => u.UnitType != UnitType.MotionSensor).ToList();
        foreach (var unit in unitsToUpdate)
        {
            Console.WriteLine("unit id" + unit.UnitId);
            dto.HistoryModel.UnitId = unit.UnitId;
            Console.WriteLine("historymodel unitid" + dto.HistoryModel.UnitId);
            HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
            loggedEvents.Add(loggedEvent);
        }
        _unitService.SetAllWindowDoorStatus(Status.Armed);
        //await _mqttPublishService.AlarmTurnOnPublish();
        
        var turnOnAlarmToClient = JsonSerializer.Serialize(new ServerHasActivatedAlarm()
        {
            History = loggedEvents
        });
        await socket.Send(turnOnAlarmToClient);
    }
}