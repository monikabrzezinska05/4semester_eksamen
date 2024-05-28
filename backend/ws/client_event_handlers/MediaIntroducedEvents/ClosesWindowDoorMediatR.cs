using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class ClosesWindowDoorMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<ClosesWindowDoorMediatRDto>
{
    public Task Handle(ClosesWindowDoorMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedEvent = historyService.CreateHistory(notification.historyModel);
        var unit = unitService.SetUnitStatus(notification.historyModel.UnitId, Status.Closed);
        var response = JsonSerializer.Serialize(new ServerClosesWindowDoor()
        {
            History = loggedEvent,
            Unit = unit
        }, StateService.JsonOptions());
        StateService.SendToAll(response);
        return Task.CompletedTask;
    }
}