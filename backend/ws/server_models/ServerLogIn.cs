using lib;

namespace ws;

public class ServerLogIn : BaseDto
{
    public string useremail { get; set; }
    public string password { get; set; }
}