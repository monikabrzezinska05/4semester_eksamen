using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerDeletesEmail : BaseDto
{
    public EmailModel Email { get; set; }
}