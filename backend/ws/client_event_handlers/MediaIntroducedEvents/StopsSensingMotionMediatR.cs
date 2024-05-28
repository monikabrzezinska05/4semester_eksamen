using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class StopsSensingMotionMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<StopsSensingMotionMediatRDto>
{
    public Task Handle(StopsSensingMotionMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedEvent = historyService.CreateHistory(notification.historyModel);
        var unit = unitService.SetUnitStatus(notification.historyModel.UnitId, Status.Disarmed);
        var response = JsonSerializer.Serialize(new ServerStopsSensingMotion()
        {
            History = loggedEvent,
            Unit = unit
        }, StateService.JsonOptions());
        StateService.SendToAll(response);
        return Task.CompletedTask;
    }
}