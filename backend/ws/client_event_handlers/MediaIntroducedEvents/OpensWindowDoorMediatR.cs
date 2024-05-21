using System.Text.Json;
using infrastructure;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class OpensWindowDoorMediatR(HistoryService historyService) : INotificationHandler<OpensWindowDoorMediatRDto>
{
    public Task Handle(OpensWindowDoorMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerOpensWindowDoor()
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