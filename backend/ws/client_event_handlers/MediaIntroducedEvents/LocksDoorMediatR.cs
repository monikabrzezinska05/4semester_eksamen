using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class LocksDoorMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<LocksDoorMediatRDto>
{
    public Task Handle(LocksDoorMediatRDto notification, CancellationToken cancellationToken)
    {
        var rfid = notification.rfid;//rfid til at finde navnet på den der låser.
        
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        var unit = unitService.SetUnitStatus(loggedHistory.UnitId, Status.Armed);
        
        var responseDto = new ServerLocksDoor
        {
            History = loggedHistory,
            Unit = notification.unit
        };
        var response = JsonSerializer.Serialize(responseDto, StateService.JsonOptions());

        StateService.SendToAll(response);
        return Task.CompletedTask;
    }
}