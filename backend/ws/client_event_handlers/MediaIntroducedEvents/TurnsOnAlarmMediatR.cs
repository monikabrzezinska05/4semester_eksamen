using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOnAlarmMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<TurnsOnAlarmMediatRDto>
{
    public Task Handle(TurnsOnAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedEvents = new List<HistoryModel>();
        var units = unitService.GetAllUnits();
        var unitsToUpdate = units.Where(u => u.UnitType != UnitType.MotionSensor).ToList();
        foreach (var unit in unitsToUpdate)
        {
            notification.historyModel.UnitId = unit.UnitId;
            HistoryModel loggedEvent = historyService.CreateHistory(notification.historyModel);
            loggedEvents.Add(loggedEvent);
        }
        unitService.SetAllWindowDoorStatus(Status.Armed);
        var dto = new ServerHasActivatedAlarm()
        {
            History = loggedEvents
        };
        var response = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(response);
        return Task.CompletedTask;
    }
}