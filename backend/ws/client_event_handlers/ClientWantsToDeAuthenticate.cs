using System.Security.Authentication;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws;

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
        if (!StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated)
        {
            Console.WriteLine("Client is not authenticated");
            throw new AuthenticationException();
        }
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = false;
        return Task.CompletedTask;
    }
}