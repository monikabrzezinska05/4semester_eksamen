using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerShowsHistory : BaseDto
{
    public List<HistoryModel> HistoryList { get; set; }
}