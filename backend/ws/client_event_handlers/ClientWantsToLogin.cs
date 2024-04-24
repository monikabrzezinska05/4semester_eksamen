using System.Text.Json;
using Fleck;
using lib;
using service;

namespace ws;

public class ClientWantsToLoginDto : BaseDto
{
    public string useremail { get; set; }
    public string password { get; set; }
}

public class ClientWantsToLogin : BaseEventHandler<ClientWantsToLoginDto>
{
    private readonly UserService _userService;
    public ClientWantsToLogin(UserService userService)
    {
        _userService = userService;
    }
    
    // ændre service ovenover til den, som vi skal bruge!!!
    
    public override async Task Handle(ClientWantsToLoginDto dto, IWebSocketConnection socket)
    {
        var user = await _userService.Login(dto.usermail, dto.password);
        if (user == null)
        {
            socket.Send("Login failed");
            return;
        }
        var userDto = new ServerBroadcastUserDto()
        {
            id = user.Id,
            username = user.Username,
            email = user.Email
        };
        socket.Send(JsonSerializer.Serialize(userDto));
    }
}