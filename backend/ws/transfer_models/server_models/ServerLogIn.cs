using lib;

namespace ws.transfer_models.server_models;

public class ServerLogIn : BaseDto
{
    public string useremail { get; set; }
    public string password { get; set; }
}