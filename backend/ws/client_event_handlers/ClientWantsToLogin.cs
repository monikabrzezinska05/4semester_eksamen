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

    // public ClientWantsToLogin(AuthenticationService authenticationService)
    // {
    //     _authenticationService = authenticationService;
    // }

    // public override async Task Handle(ClientWantsToLoginDto dto, IWebSocketConnection socket)
    // {
    //     var newUserLogin = new UserLogin()
    //     {
    //         Email = dto.email,
    //         Password = dto.password
    //     };
    //     
    //     var user = _authenticationService.Authenticate(newUserLogin);
    //     Console.WriteLine("User: " + user!.Name);
    //     ResponseDto loginMessage;
    //     if (user == null)
    //     {
    //         loginMessage = new ResponseDto()
    //         {
    //             MessageToClient = "Invalid email or password"
    //         };
    //     } else 
    //     {
    //         loginMessage = new ResponseDto()
    //         {
    //             MessageToClient = "You are logged in",
    //             ResponseData = user
    //         };
    //         
    //     }
    //     var serverLogin = new ServerLogIn()
    //     {
    //         ResponseDto = loginMessage
    //     };
    //     socket.Send(JsonSerializer.Serialize(serverLogin));
    // }

    public override Task Handle(ClientWantsToLoginDto request, IWebSocketConnection socket)
    {
        Console.WriteLine("vi er i handler!");
        Console.WriteLine("request: " + request.userLogin.Email + " " + request.userLogin.Password);

        Console.WriteLine("object lavet");
        
        var user = _authenticationService.Authenticate(request.userLogin);
        Console.WriteLine("vi har user");
        
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = true;
        StateService.GetClient(socket.ConnectionInfo.Id).user = user;
        
        socket.SendDto(new ServerAuthenticatesUser() { jwt = _tokenService.IssueJwt(user) });

        return Task.CompletedTask;
    }
}