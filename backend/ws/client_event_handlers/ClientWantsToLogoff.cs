using Fleck;
using lib;
using ws;

namespace ws;

public class ClientWantsToLogoffDto : BaseDto
{
    public string email { get; set; }
    public string password { get; set; }
}

public class ClientWantsToLogoff : BaseEventHandler<ClientWantsToLogoffDto>
{
    public override Task Handle(ClientWantsToLogoffDto dto, IWebSocketConnection socket)
    {
        
    }
}