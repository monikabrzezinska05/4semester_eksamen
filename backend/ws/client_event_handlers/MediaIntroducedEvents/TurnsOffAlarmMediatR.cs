using System.Text.Json;
using infrastructure;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOffAlarmMediatR(HistoryService historyService) : INotificationHandler<TurnsOffAlarmMediatRDto>
{
    public Task Handle(TurnsOffAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerHasDeactivatedAlarm()
        {
            History = notification.historyModel
        };
        historyService.CreateHistory(dto.History);
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}