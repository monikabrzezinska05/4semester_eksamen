using api.transfer_models;
using infrastructure;
using MediatR;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers.MediaIntroducedEvents;

public class SensingMotionMediatR : INotificationHandler<SensingMotionMediatRDto>
{
    public Task Handle(SensingMotionMediatRDto notification, CancellationToken cancellationToken)
    {
        var dto = new ServerSensesMotion { ResponseDto = new ResponseDto()
        {
            ResponseData = notification.historyModel.EventTypeId 
        }};
        
    }
}