namespace infrastructure.models;

public class HistoryModel
{
    public int? HistoryId { get; set; }
    public string? PersonName { get; set; }
    public int UnitId { get; set; }
    public Unit? Unit { get; set; }
    public DateTime Date { get; set; }
    public EventType EventType { get; set; }
}

public enum EventType
{
    Open,
    Close,
    AlarmTriggered,
    AlarmStopped,
    AlarmArmed,
    AlarmDisarmed,
}