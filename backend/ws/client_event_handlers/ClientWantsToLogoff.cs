using Fleck;
using lib;
using ws;

namespace ws;

public class ClientWantsToLogoffDto : BaseDto
{
    
}

public class ClientWantsToLogoff : BaseEventHandler<ClientWantsToLogoffDto>
{
    public override Task Handle(ClientWantsToLogoffDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}