using api.transfer_models;
using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerLocksDoor : BaseDto
{
    public HistoryModel History { get; set; }
    public Unit Unit { get; set; }
}