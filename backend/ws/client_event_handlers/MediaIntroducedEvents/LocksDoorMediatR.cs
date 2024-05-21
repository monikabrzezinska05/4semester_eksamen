using infrastructure;
using MediatR;
using service;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class LocksDoorMediatR(HistoryService historyService) : INotificationHandler<SensingMotionMediatRDto>
{
    public Task Handle(SensingMotionMediatRDto notification, CancellationToken cancellationToken)
    {
        throw new NotImplementedException();
    }
}