using infrastructure.models;
using MediatR;
using Unit = infrastructure.models.Unit;

namespace infrastructure;

public class AlarmTriggerMediatRDto : INotification
{
    public HistoryModel HistoryModel { get; set; }
    public Unit Unit { get; set; }
}