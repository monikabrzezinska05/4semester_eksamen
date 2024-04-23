namespace ws;

public class ClientOpensWindowDoorDto: BaseDto
{
    
}

private class ClientOpensWindowDoor : BaseEventHandler<ClientOpensWindowDoorDto>
{
    public override Task Handle(ClientOpensWindowDoorDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}