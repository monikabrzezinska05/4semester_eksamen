namespace ws;

public class ClientWantsToLogoffDto : BaseDto
{
    throw new System.NotImplementedException();
}

public class ClientWantsToLogoff : BaseEventHandler<ClientWantsToLogoffDto>
{
    public override Task Handle(ClientWantsToLogoffDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}