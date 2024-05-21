using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerCreatesNewUser : BaseDto
{
    public string MessageToClient { get; set; }
    public User? User { get; set; }
}