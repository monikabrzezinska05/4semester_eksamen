using Fleck;
using lib;

namespace ws;

public class ClientWantsToTurnOnAlarmDto: BaseDto
{
    
}

public class ClientWantsToTurnOnAlarm : BaseEventHandler<ClientWantsToTurnOnAlarmDto>
{
    public override Task Handle(ClientWantsToTurnOnAlarmDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}