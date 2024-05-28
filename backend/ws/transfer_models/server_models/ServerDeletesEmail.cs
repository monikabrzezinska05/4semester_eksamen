using lib;

namespace ws.transfer_models.server_models;

public class ServerDeletesEmail : BaseDto
{
    public bool Success { get; set; }
    public int EmailId { get; set; }
}