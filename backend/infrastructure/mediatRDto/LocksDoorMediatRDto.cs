using infrastructure.models;
using MediatR;
using Unit = infrastructure.models.Unit;

namespace infrastructure;

public class LocksDoorMediatRDto : INotification
{
    public string? rfid { get; set; }
    public HistoryModel historyModel { get; set; }
    public Unit unit { get; set; }
}