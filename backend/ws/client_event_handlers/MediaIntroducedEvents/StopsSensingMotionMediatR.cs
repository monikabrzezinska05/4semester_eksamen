using System.Text.Json;
using infrastructure;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class StopsSensingMotionMediatR(HistoryService historyService) : INotificationHandler<StopsSensingMotionMediatRDto>
{
    public Task Handle(StopsSensingMotionMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerStopsSensingMotion
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