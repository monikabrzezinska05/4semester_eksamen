using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class AlarmTriggerMediatR(HistoryService historyService, UnitService unitService, EmailService emailService) : INotificationHandler<AlarmTriggerMediatRDto>
{
    public Task Handle(AlarmTriggerMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerAlarmTriggered()
        {
            History = notification.HistoryModel,
            Unit = unitService.GetUnitById(notification.HistoryModel.UnitId)
        };
        historyService.CreateHistory(dto.History);
        emailService.SendEmail(dto.History, dto.Unit);
        unitService.SetUnitStatus(dto.History.UnitId, Status.Triggered);
        
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());
        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}