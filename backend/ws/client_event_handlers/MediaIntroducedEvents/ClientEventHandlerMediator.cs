using infrastructure.models;
using MediatR;

namespace ws.client_event_handlers.MediaIntroducedEvents;
not
public class ClientEventHandlerMediatorDto : INotification
{
    public HistoryModel historyModel { get; set; }
}

public class ClientEventHandlerMediator : INotificationHandler<ClientEventHandlerMediatorDto>
{
    public Task Handle(ClientEventHandlerMediatorDto notification, CancellationToken cancellationToken)
    {
        var dto = new 
    }
}