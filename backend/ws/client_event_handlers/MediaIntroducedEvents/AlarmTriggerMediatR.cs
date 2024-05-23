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
            Unit = notification.Unit
        };
        historyService.CreateHistory(dto.History);
        Console.WriteLine("tjek 1");
        emailService.SendEmail(dto.History, dto.Unit);
        Console.WriteLine("tjek 2");
        unitService.SetUnitStatus(dto.History.UnitId, Status.Triggered);
        Console.WriteLine("tjek 3");
        
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());
        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}