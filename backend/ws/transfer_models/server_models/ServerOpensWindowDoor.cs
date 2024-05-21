using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerOpensWindowDoor : BaseDto
{
    public HistoryModel history { get; set; }
    public Unit Unit { get; set; }
}