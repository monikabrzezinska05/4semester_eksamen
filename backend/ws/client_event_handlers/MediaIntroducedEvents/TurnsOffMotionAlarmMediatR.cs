using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOffMotionAlarmMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<TurnsOffMotionAlarmMediatRDto>
{
    public Task Handle(TurnsOffMotionAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        unitService.SetMotionSensorStatus(Status.Disarmed);
        var dto = new ServerHasDeactivatedMotionSensorAlarm()
        {
            History = loggedHistory,
        };
        
        var responseDto = JsonSerializer.Serialize(dto, StateService.JsonOptions());
        StateService.SendToAll(responseDto);
        return Task.CompletedTask;
    }
}