using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOnMotionAlarmMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<TurnsOnMotionAlarmMediatRDto>
{
    public Task Handle(TurnsOnMotionAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        unitService.SetMotionSensorStatus(Status.Armed);
        var dto = new ServerHasActivatedAlarm()
        {
            History = loggedHistory
        };
        var response = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(response);
        return Task.CompletedTask;
    }
}