using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOnAlarmMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<TurnsOnAlarmMediatRDto>
{
    public Task Handle(TurnsOnAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        unitService.SetAllWindowDoorStatus(Status.Armed);
        var dto = new ServerHasActivatedAlarm()
        {
            History = loggedHistory
        };
        var response = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(response);
        return Task.CompletedTask;
    }
}