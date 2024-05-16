using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

public class ClientWantsToLoginDto : BaseDto
{
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
        var jwt = _tokenService.IssueJwt(user!);

        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = true;
        StateService.GetClient(socket.ConnectionInfo.Id).user = user!;

        var responseToClient = JsonSerializer.Serialize(new ServerAuthenticatesUser()
            {
                User = user,
                Jwt = jwt
            },
            StateService.JsonOptions()
        );
        socket.Send(responseToClient);
        return Task.CompletedTask;
    }
}