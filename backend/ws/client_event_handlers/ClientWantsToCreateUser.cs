using Fleck;
using lib;
using service;

namespace ws.client_event_handlers;

public class ClientWantsToCreateUserDto : BaseDto
{
    public string email { get; set; }
    public string password { get; set; }
}

public class ClientWantsToCreateUser : BaseEventHandler<ClientWantsToCreateUserDto>
{
    public readonly UserService _userService;
    
    public ClientWantsToCreateUser(UserService userService)
    {
        _userService = userService;
    }
    
    public override Task Handle(ClientWantsToCreateUserDto dto, IWebSocketConnection socket)
    {
        var user = _userService.CreateUser( , dto.password);
    }
}