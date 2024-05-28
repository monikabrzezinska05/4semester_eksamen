using Fleck;
using lib;
using service;

namespace ws.client_event_handlers;

public class MobileWantsNotificationsDto : BaseDto
{
    public string token { get; set; }
}

public class MobileWantsNotifications : BaseEventHandler<MobileWantsNotificationsDto>
{
    public override Task Handle(MobileWantsNotificationsDto dto, IWebSocketConnection socket)
    {
        StateService.AddNotificationToken(dto.token);
        return Task.CompletedTask;
    }
}