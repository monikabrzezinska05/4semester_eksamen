using infrastructure.models;
using MediatR;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class SensingMotionMediatRDto : INotification
{
    public HistoryModel historyModel { get; set; }
}

public class SensingMotionMediatR : INotificationHandler<SensingMotionMediatRDto>
{
    public Task Handle(SensingMotionMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerSensesMotion { ResponseDto = notification.historyModel.EventTypeId };
        
    }
}