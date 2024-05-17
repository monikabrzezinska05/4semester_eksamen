using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerShowsUnits : BaseDto
{
    public string MessageToClient { get; set; }
    public List<Unit> UnitList { get; set; }
}