using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToCreateUserDto : BaseDto
{
    public string name { get; set; }
    public string password { get; set; }
    public bool isChild { get; set; }
}

public class ClientWantsToCreateUser : BaseEventHandler<ClientWantsToCreateUserDto>
{
    public readonly UserService _userService;
    
    public ClientWantsToCreateUser(UserService userService)
    {
        _userService = userService;
    }
    
    public override async Task Handle(ClientWantsToCreateUserDto dto, IWebSocketConnection socket)
    {
        var user = _userService.CreateUser(user: new User(), dto.password);
        ResponseDto createUserMessage;
        if (user == null)
        {
            createUserMessage = new ResponseDto()
            {
                MessageToClient = "User already exists"
            };
        } else 
        {
            createUserMessage = new ResponseDto()
            {
                MessageToClient = "User created",
                ResponseData = user
            };
        }
        
        var serverCreateUser = new ServerCreatesNewUser()
        {
            ResponseDto = createUserMessage
        };
        socket.Send(JsonSerializer.Serialize(serverCreateUser));
    }
}