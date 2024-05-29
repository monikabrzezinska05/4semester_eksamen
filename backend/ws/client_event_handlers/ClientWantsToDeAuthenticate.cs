using System.Security.Authentication;
using Fleck;
using lib;
using service;
using ws.transfer_models.server_models;
using JsonSerializer = System.Text.Json.JsonSerializer;

namespace ws;

public class ClientWantsToDeAuthenticateDto : BaseDto {}

public class ClientWantsToDeAuthenticate() : BaseEventHandler<ClientWantsToDeAuthenticateDto>
{
    private readonly TokenService _tokenService;

    public ClientWantsToDeAuthenticate(TokenService tokenService) : this()
    {
        _tokenService = tokenService;
    }

    public override Task Handle(ClientWantsToDeAuthenticateDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        if (!StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated)
        {
            throw new AuthenticationException();
        }
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = false;
        
        var response = new ServerDeAuthenticatesUser()
        {
            MessageToClient = "Connection closed"
        };
        
        socket.Send(JsonSerializer.Serialize(response, StateService.JsonOptions()));
        return Task.CompletedTask;
    }
}