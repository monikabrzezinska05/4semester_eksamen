using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToLoginDto : BaseDto
{
    public UserLogin userLogin { get; set; }
}

public class ClientWantsToLogin : BaseEventHandler<ClientWantsToLoginDto>
{
    private readonly AuthenticationService _authenticationService;
    private readonly TokenService _tokenService;
    
    public ClientWantsToLogin(AuthenticationService authenticationService, TokenService tokenService)
    { 
        _authenticationService = authenticationService;
        _tokenService = tokenService;
    }
    
    public override async Task Handle(ClientWantsToLoginDto dto, IWebSocketConnection socket)
    {
        var user = _authenticationService.Authenticate(dto.userLogin);
        var userToken = _tokenService.IssueJwt(user);
        Console.WriteLine("User: " + user!.Name);
        ResponseDto loginMessage;
        
        if (user == null )
        {
            loginMessage = new ResponseDto()
            {
                MessageToClient = "Invalid email or password"
            };
        } else 
        {
            loginMessage = new ResponseDto()
            {
                MessageToClient = "You are logged in",
                ResponseData = user
            };
            StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = true;
            StateService.GetClient(socket.ConnectionInfo.Id).user = user;
            socket.SendDto(new ServerAuthenticatesUser {jwt = _tokenService.IssueJwt(user)});
        }
        var serverLogin = new ServerLogIn()
        {
            ResponseDto = loginMessage
        };
        socket.Send(JsonSerializer.Serialize(serverLogin));
    }
}