using api.transfer_models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerDeAuthenticatesUser : BaseDto
{
    public ResponseDto ResponseDto { get; set; }
}