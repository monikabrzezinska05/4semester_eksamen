using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerAlarmTriggered: BaseDto
{
    public HistoryModel History { get; set; }
}