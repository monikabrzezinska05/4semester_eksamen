using Fleck;
using lib;

namespace ws;

public class ClientWantsToChangeEmailListDto : BaseDto
{
    
}

public class ClientWantsToChangeEmailList : BaseEventHandler<ClientWantsToChangeEmailListDto>
{
    public override Task Handle(ClientWantsToChangeEmailListDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}
