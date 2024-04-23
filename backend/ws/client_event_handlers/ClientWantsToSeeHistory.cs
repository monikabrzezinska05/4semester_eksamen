using Fleck;
using lib;

namespace ws;

public class ClientWantsToSeeHistoryDto: BaseDto
{
    
}

public class ClientWantsToSeeHistory : BaseEventHandler<ClientWantsToSeeHistoryDto>
{
    public override Task Handle(ClientWantsToSeeHistoryDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}