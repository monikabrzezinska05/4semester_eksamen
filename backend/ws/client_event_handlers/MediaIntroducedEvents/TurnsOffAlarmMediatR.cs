using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOffAlarmMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<TurnsOffAlarmMediatRDto>
{
    public Task Handle(TurnsOffAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        unitService.SetAllWindowDoorStatus(Status.Disarmed);
        var dto = new ServerHasDeactivatedAlarm()
        {
            History = loggedHistory
        };
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}