using infrastructure;
using MediatR;
using service;
using ws.transfer_models.server_models;
using JsonSerializer = System.Text.Json.JsonSerializer;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class SensingMotionMediatR(HistoryService historyService) : INotificationHandler<SensingMotionMediatRDto>
{
    public Task Handle(SensingMotionMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerSensesMotion
        {
            History = notification.historyModel,
            Unit = notification.unit
        };
        historyService.CreateHistory(dto.History);
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}