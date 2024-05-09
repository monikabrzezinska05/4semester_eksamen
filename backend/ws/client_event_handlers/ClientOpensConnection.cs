using System.Text.Json;
using api.transfer_models;
using Fleck;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientOpensConnectionDto : BaseDto
{
    // Skal nok laves om til at passe med noget JWT, men skal bare lige have det til at virke...
    public string? ConnectionId { get; set; }
}

public class ClientOpensConnection : BaseEventHandler<ClientOpensConnectionDto>
{
    private readonly UnitService _unitService;
    public ClientOpensConnection(UnitService unitService)
    {
        _unitService = unitService;
    }
    
    public override Task Handle(ClientOpensConnectionDto dto, IWebSocketConnection socket)
    {
        var responseDto = new ResponseDto()
        {
            ResponseData = _unitService.GetAllUnits(),
            MessageToClient = "Connection opened"
        };
        var option = new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };
        var responseToClient = JsonSerializer.Serialize(new ServerOpensConnection()
        {
            ResponseDto = responseDto
        }, option);
        socket.Send(responseToClient);
        return Task.CompletedTask;
    }
}