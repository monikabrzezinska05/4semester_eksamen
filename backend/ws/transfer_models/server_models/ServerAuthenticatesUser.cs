using lib;

namespace ws.transfer_models.server_models;

public class ServerAuthenticatesUser : BaseDto
{
    public string? jwt { get; set; }
}