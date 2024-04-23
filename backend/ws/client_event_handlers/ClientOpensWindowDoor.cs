using Fleck;
using lib;

namespace ws;

public class ClientOpensWindowDoorDto: BaseDto
{
    
}

public class ClientOpensWindowDoor : BaseEventHandler<ClientOpensWindowDoorDto>
{
    public override Task Handle(ClientOpensWindowDoorDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}