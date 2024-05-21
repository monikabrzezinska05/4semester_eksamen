using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerHasActivatedAlarm : BaseDto
{
    public HistoryModel historyModel { get; set; }
    public Unit Unit { get; set; } WRONG
}