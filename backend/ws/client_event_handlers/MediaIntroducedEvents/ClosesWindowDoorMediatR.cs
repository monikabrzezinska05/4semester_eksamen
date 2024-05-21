using System.Text.Json;
using infrastructure;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class ClosesWindowDoorMediatR(HistoryService historyService) : INotificationHandler<ClosesWindowDoorMediatRDto>
{
    public Task Handle(ClosesWindowDoorMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerClosesWindowDoor
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