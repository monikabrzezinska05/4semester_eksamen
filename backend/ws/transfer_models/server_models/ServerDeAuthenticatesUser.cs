using lib;

namespace ws.transfer_models.server_models;

public class ServerDeAuthenticatesUser : BaseDto
{
    public string MessageToClient { get; set; }
}