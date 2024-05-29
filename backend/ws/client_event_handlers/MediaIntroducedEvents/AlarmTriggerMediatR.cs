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
        var loggedHistory = historyService.CreateHistory(notification.HistoryModel);
        var updatedUnit = unitService.SetUnitStatus(notification.HistoryModel.UnitId, Status.Triggered);
        emailService.SendEmail(notification.HistoryModel, updatedUnit);
        NotificationService.SendNotification(StateService.GetNotificationTokens());
        
        var dto = new ServerAlarmTriggered()
        {
            History = loggedHistory,
            Unit = updatedUnit
        };
        
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());
        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}