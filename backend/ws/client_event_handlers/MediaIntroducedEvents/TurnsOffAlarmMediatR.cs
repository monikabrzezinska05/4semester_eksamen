using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOffAlarmMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<TurnsOffAlarmMediatRDto>
{
    public Task Handle(TurnsOffAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        var loggedEvents = new List<HistoryModel>();
        var units = unitService.GetAllUnits();
        var unitsToUpdate = units.Where(u => u.UnitType != UnitType.MotionSensor).ToList();
        foreach (var unit in unitsToUpdate)
        {
            notification.historyModel.UnitId = unit.UnitId;
            HistoryModel loggedEvent = historyService.CreateHistory(notification.historyModel);
            loggedEvents.Add(loggedEvent);
        }
        unitService.SetAllWindowDoorStatus(Status.Disarmed);
        var dto = new ServerHasDeactivatedAlarm()
        {
            History = loggedEvents
        };
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());

        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}