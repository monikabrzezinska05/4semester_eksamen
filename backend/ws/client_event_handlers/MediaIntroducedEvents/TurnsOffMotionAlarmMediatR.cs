using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class TurnsOffMotionAlarmMediatR(HistoryService historyService, UnitService unitService) : INotificationHandler<TurnsOffMotionAlarmMediatRDto>
{
    public Task Handle(TurnsOffMotionAlarmMediatRDto notification, CancellationToken cancellationToken)
    {
        var loggedHistory = historyService.CreateHistory(notification.historyModel);
        var loggedEvents = new List<HistoryModel>();
        var units = unitService.GetAllUnits();
        var unitsToUpdate = units.Where(u => u.UnitType == UnitType.MotionSensor).ToList();
        foreach (var unit in unitsToUpdate)
        {
            notification.historyModel.UnitId = unit.UnitId;
            HistoryModel loggedEvent = historyService.CreateHistory(notification.historyModel);
            loggedEvents.Add(loggedEvent);
        }
        unitService.SetMotionSensorStatus(Status.Disarmed);
        var dto = new ServerHasDeactivatedMotionSensorAlarm()
        {
            History = loggedEvents,
        };
        var dtoResult = JsonSerializer.Serialize(dto, StateService.JsonOptions());
        
        StateService.SendToAll(dtoResult);
        return Task.CompletedTask;
    }
}