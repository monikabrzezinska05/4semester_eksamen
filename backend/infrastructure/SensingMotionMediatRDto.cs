using infrastructure.models;
using MediatR;

namespace infrastructure;

public class SensingMotionMediatRDto : INotification
{
    public HistoryModel historyModel { get; set; }
}