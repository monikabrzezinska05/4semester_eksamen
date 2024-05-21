using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws;

public class ClientWantsToCreateUserDto : BaseDto
{
    public User userModel { get; set; }
    public string password { get; set; }
}

public class ClientWantsToCreateUser : BaseEventHandler<ClientWantsToCreateUserDto>
{
    private readonly UserService _userService;

    public ClientWantsToCreateUser(UserService userService)
    {
        _userService = userService;
    }

    public override async Task Handle(ClientWantsToCreateUserDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);

        var newUser = dto.userModel;
        
        var user = _userService.CreateUser(newUser, dto.password);
        var createUserMessage = new ServerCreatesNewUser();
        
        
        if (user == null)
        {
            createUserMessage = new ServerCreatesNewUser()
            {
                MessageToClient = "User already exists"
            };
        }
        else
        {
            createUserMessage = new ServerCreatesNewUser()
            {
                MessageToClient = "User created",
                User = user
            };
        }

        socket.Send(JsonSerializer.Serialize(createUserMessage, StateService.JsonOptions()));
    }
}