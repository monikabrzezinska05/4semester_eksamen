namespace ws;

public class ClientClosesWindowDoorDto : BaseDto
{
    
}

public class ClientClosesWindowDoor : BaseEventHandler<ClientClosesWindowDoorDto>
{
    public override Task Handle(ClientClosesWindowDoorDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}