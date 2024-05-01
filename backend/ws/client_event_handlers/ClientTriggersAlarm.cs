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
    private readonly UnitService _unitService;
    private readonly EmailService _emailService;

    public ClientTriggersAlarm(HistoryService historyService, UnitService unitService, EmailService emailService)
    {
        _historyService = historyService;
        _unitService = unitService;
        _emailService = emailService;
    }

    public override Task Handle(ClientTriggersAlarmDto dto, IWebSocketConnection socket)
    {
        HistoryModel loggedEvent = _historyService.CreateHistory(dto.HistoryModel);
        Unit unit = _unitService.getUnitById(dto.HistoryModel.UnitId);
        _emailService.SendEmail(loggedEvent, unit);
        var alarmTriggerDto = new ResponseDto()
        {   
            ResponseData = loggedEvent
        };
        var alarmTriggerToClient = JsonSerializer.Serialize(alarmTriggerDto);
        socket.Send(alarmTriggerToClient);
        return Task.CompletedTask;
    }
}

// TO DO - Når alarmen trigger skal den sende en notifikation - mailing liste skal laves.