using api.transfer_models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerAlarmTriggered: BaseDto
{
    public ResponseDto ResponseDto { get; set; }
}