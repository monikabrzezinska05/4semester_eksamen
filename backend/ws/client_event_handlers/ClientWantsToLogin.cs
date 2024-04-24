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
    public string email { get; set; }
    public string password { get; set; }
}

public class ClientWantsToLogin : BaseEventHandler<ClientWantsToLoginDto>
{
    private readonly AuthenticationService _authenticationService;
    
    public ClientWantsToLogin(AuthenticationService authenticationService)
    { 
        _authenticationService = authenticationService;
    }
    
    public override async Task Handle(ClientWantsToLoginDto dto, IWebSocketConnection socket)
    {
        var newUserLogin = new UserLogin()
        {
            Email = dto.email,
            Password = dto.password
        };
        
        var user = _authenticationService.Authenticate(newUserLogin);
        Console.WriteLine("User: " + user!.Name);
        ResponseDto loginMessage;
        if (user == null)
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
        }
        var serverLogin = new ServerLogIn()
        {
            ResponseDto = loginMessage
        };
        socket.Send(JsonSerializer.Serialize(serverLogin));
    }
}