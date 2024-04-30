using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;

namespace ws;

public class ClientTriggersAlarmDto : BaseDto
{
    public HistoryModel HistoryModel { get; set; }
}
public class ClientTriggersAlarm : BaseEventHandler<ClientTriggersAlarmDto>
{
    private readonly HistoryService _historyService;

    public ClientTriggersAlarm(HistoryService historyService)
    {
        _historyService = historyService;
    }

    public override Task Handle(ClientTriggersAlarmDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
        var alarmTriggerDto = new ResponseDto()
        {   
            ResponseData = loggedEvent
        };
        var alarmTriggerToClient = JsonSerializer.Serialize(alarmTriggerDto);
        socket.Send(alarmTriggerToClient);
        return Task.CompletedTask;
    }
}