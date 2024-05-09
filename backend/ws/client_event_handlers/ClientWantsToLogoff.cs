using System.Security.Authentication;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws;

namespace ws;

public class ClientWantsToLogoffDto : BaseDto
{
    public UserLogin UserLogin { get; set; }
}

public class ClientWantsToLogoff() : BaseEventHandler<ClientWantsToLogoffDto>
{
    private readonly TokenService _tokenService;

    public ClientWantsToLogoff(TokenService tokenService) : this()
    {
        _tokenService = tokenService;
    }

    public override Task Handle(ClientWantsToLogoffDto dto, IWebSocketConnection socket)
    {
        if (!StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated)
        {
            throw new AuthenticationException();
        }
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = false;
        
        return Task.CompletedTask;
    }
}