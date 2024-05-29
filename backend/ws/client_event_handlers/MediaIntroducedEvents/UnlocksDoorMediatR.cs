using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class UnlocksDoorMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<UnlocksDoorMediatRDto>
{
    public Task Handle(UnlocksDoorMediatRDto notification, CancellationToken cancellationToken)
    {
        var rfid = notification.rfid;//rfid til at finde navnet på den der låser op.
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        var unit = unitService.SetUnitStatus(loggedHistory.UnitId, Status.Disarmed);
        
        var dto = new ServerUnlocksDoor
        {
            History = loggedHistory,
            Unit = unit
        };
        historyService.CreateHistory(dto.History);
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}