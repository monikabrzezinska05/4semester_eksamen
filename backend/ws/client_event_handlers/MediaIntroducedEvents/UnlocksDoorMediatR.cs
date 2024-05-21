using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class UnlocksDoorMediatR(HistoryService historyService) : INotificationHandler<UnlocksDoorMediatRDto>
{
    public Task Handle(UnlocksDoorMediatRDto notification, CancellationToken cancellationToken)
    {
        var rfid = notification.rfid;//rfid til at finde navnet på den der låser op.
        
        var dto = new ServerUnlocksDoor
        {
            History = new HistoryModel
            {
                PersonName = "Boobie",//Lav det med at bruge rfid til at finde navnet.
                UnitId = notification.historyModel.UnitId,
                Date = notification.historyModel.Date,
                EventType = notification.historyModel.EventType
            },
            Unit = notification.unit
        };
        historyService.CreateHistory(dto.History);
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}