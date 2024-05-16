namespace infrastructure.models;

public class HistoryModel
{
    public int? HistoryId { get; set; }
    public string? UserEmail { get; set; }
    public int UnitId { get; set; }
    public string? UnitTable { get; set; }
    public Unit? Unit {get; set;}
    public DateTime Date { get; set; }
    public EventType EventTypeId { get; set; }
}