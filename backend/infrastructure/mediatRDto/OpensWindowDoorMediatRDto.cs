using infrastructure.models;
using MediatR;
using Unit = infrastructure.models.Unit;

namespace infrastructure;

public class OpensWindowDoorMediatRDto : INotification
{
    public HistoryModel historyModel { get; set; }
    public Unit unit { get; set; }
}