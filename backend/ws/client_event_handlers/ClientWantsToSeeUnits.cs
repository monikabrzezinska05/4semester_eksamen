using System.Text.Json;
using api.transfer_models;
using Fleck;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToSeeUnitsDto : BaseDto
{
    // Skal nok laves om til at passe med noget JWT, men skal bare lige have det til at virke...
    public string? ConnectionId { get; set; }
}

public class ClientWantsToSeeUnits : BaseEventHandler<ClientWantsToSeeUnitsDto>
{
    private readonly UnitService _unitService;
    public ClientWantsToSeeUnits(UnitService unitService)
    {
        _unitService = unitService;
    }
    
    public override Task Handle(ClientWantsToSeeUnitsDto dto, IWebSocketConnection socket)
    {
        if (!StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated)
        {
            Console.WriteLine("user not authenticated");
        }
        var responseDto = new ResponseDto()
        {
            ResponseData = _unitService.GetAllUnits(),
            MessageToClient = "Units retrieved successfully!"
        };
        var option = new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };
        var responseToClient = JsonSerializer.Serialize(new ServerShowsUnits()
        {
            ResponseDto = responseDto
        }, option);
        socket.Send(responseToClient);
        return Task.CompletedTask;
    }
}