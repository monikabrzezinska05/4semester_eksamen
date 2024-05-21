using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerShowsUnits : BaseDto
{
    public List<Unit> UnitList { get; set; }
}