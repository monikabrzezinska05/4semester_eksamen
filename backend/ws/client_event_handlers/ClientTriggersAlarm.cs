namespace ws;

public class ClientTriggersAlarmDto : BaseDto
{
    
}
public class ClientTriggersAlarm : BaseEventHandler<ClientTriggersAlarmDto>
{
    public override Task Handle(ClientTriggersAlarmDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}