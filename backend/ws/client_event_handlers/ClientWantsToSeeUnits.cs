using System.Text.Json;
using api.transfer_models;
using Fleck;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToSeeUnitsDto : BaseDto
{
    
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
        
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
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