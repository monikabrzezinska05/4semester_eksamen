using Fleck;
using lib;

namespace ws;

public class ClientWantsToTurnOffAlarmDto: BaseDto
{
    
}

public class ClientWantsToTurnOffAlarm : BaseEventHandler<ClientWantsToTurnOffAlarmDto>
{
    public override Task Handle(ClientWantsToTurnOffAlarmDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}