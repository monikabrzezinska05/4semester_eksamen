using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerAuthenticatesUser : BaseDto
{
    public User? User { get; set; }
    public string Jwt { get; set; }
}