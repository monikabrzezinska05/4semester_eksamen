namespace infrastructure.models;

public class History
{
    public int HistoryId { get; set; }
    public int UserId { get; set; }
    public int UnitId { get; set; }
    public DateTime Date { get; set; }
    public EventType EventTypeId { get; set; }
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