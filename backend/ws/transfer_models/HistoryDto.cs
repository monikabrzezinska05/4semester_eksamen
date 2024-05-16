using infrastructure.models;

namespace api.transfer_models;

public class HistoryDto
{
    public int HistoryId { get; set; }
    public string? PersonName { get; set; }
    public Unit Unit { get; set; }
    public DateTime Date { get; set; }
    public EventType EventTypeId { get; set; }
}

