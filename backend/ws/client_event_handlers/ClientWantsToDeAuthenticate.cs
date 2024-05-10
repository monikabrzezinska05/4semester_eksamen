using System.Security.Authentication;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using Newtonsoft.Json;
using service;
using ws;
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
        Console.WriteLine(StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated);
        if (!StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated)
        {
            Console.WriteLine("Client is not authenticated");
            throw new AuthenticationException();
        }
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = false;
        
        var responseDto = new ResponseDto()
        {
            MessageToClient = "Connection closed"
        };
        var response = JsonSerializer.Serialize(new ServerDeAuthenticatesUser()
        {
            ResponseDto = responseDto
        });
        socket.Send(response);
        return Task.CompletedTask;
    }
}