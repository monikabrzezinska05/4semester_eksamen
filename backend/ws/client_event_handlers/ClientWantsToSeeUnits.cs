using System.Text.Json;
using Fleck;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToSeeUnitsDto : BaseDto {}

public class ClientWantsToSeeUnits : BaseEventHandler<ClientWantsToSeeUnitsDto>
{
    private readonly UnitService _unitService;
    public ClientWantsToSeeUnits(UnitService unitService)
    {
        _unitService = unitService;
    }
    
    public override Task Handle(ClientWantsToSeeUnitsDto dto, IWebSocketConnection socket)
    {
        
        //StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        var units = _unitService.GetAllUnits().ToList();
        
        var option = new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };
        var responseToClient = JsonSerializer.Serialize(new ServerShowsUnits()
        {
            MessageToClient = "Here are the units",
            UnitList = units
        }, option);
        socket.Send(responseToClient);
        return Task.CompletedTask;
    }
}