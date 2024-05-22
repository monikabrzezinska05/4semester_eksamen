using System.Text.Json;
using infrastructure;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOffMotionAlarmMediatR(HistoryService historyService) : INotificationHandler<TurnsOffMotionAlarmMediatRDto>
{
    public Task Handle(TurnsOffMotionAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerHasDeactivatedMotionSensorAlarm()
        {
            History = notification.historyModel,
        };
        historyService.CreateHistory(dto.History);
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}