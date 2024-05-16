using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerCreatesEmail : BaseDto
{
    public EmailModel Email { get; set; }
}