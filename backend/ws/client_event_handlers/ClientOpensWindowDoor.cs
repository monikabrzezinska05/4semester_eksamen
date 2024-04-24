using Fleck;
using infrastructure.models;
using lib;

namespace ws;

public class ClientOpensWindowDoorDto: BaseDto
{
    public List<HistoryModel> historyRecords { get; set; }
}

public class ClientOpensWindowDoor : BaseEventHandler<ClientOpensWindowDoorDto>
{
    public override Task Handle(ClientOpensWindowDoorDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}