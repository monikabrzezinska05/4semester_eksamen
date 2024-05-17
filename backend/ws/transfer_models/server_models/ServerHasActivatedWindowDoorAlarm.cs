using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerHasActivatedWindowDoorAlarm : BaseDto
{
    public HistoryModel historyModel { get; set; }
}