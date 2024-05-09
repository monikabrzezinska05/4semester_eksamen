using System.Security.Authentication;
using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using infrastructure.repositories;
using lib;
using service;
using ws;
using ws.transfer_models.server_models;

public class ClientWantsToLoginDto : BaseDto {
    public UserLogin userLogin { get; set; }
}

public class ClientWantsToLogin() : BaseEventHandler<ClientWantsToLoginDto>
{
    private readonly AuthenticationService _authenticationService;
    private readonly TokenService _tokenService;
    
    public ClientWantsToLogin(AuthenticationService authenticationService, TokenService tokenService) : this()
    {
        _authenticationService = authenticationService;
        _tokenService = tokenService;
    }

    public override Task Handle(ClientWantsToLoginDto request, IWebSocketConnection socket)
    {
        var user = _authenticationService.Authenticate(request.userLogin);
        
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = true;
        StateService.GetClient(socket.ConnectionInfo.Id).user = user!;
        var jwt = _tokenService.IssueJwt(user!);
        
        socket.SendDto(new ServerAuthenticatesUser() { ResponseDto = });

        return Task.CompletedTask;
    }
}