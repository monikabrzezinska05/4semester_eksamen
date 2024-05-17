using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerHasDeactivatedWindowDoorAlarm : BaseDto
{
    public HistoryModel historyModel { get; set; }
}