using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;
using JsonSerializer = System.Text.Json.JsonSerializer;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class SensingMotionMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<SensingMotionMediatRDto>
{
    public Task Handle(SensingMotionMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedEvent = historyService.CreateHistory(notification.historyModel);
        var unit = unitService.SetUnitStatus(notification.historyModel.UnitId, Status.Armed);
        var response = JsonSerializer.Serialize(new ServerSensesMotion()
        {
            History = loggedEvent,
            Unit = unit
        }, StateService.JsonOptions());
        StateService.SendToAll(response);
        return Task.CompletedTask;
    }
}