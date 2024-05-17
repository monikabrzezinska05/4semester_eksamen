using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerShowsHistory : BaseDto
{
    public string? MessageToClient { get; set; }
    public List<HistoryModel> HistoryList { get; set; }
    public string? Jwt { get; set; }
}