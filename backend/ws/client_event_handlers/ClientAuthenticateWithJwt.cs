using System.Text.Json;
using api.transfer_models;
using Fleck;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientAuthenticateWithJwtDto : BaseDto
{
    public string Jwt { get; set; }
    public string User { get; set; }
}

public class ClientAuthenticateWithJwt : BaseEventHandler<ClientAuthenticateWithJwtDto>
{
    private readonly TokenService _tokenService;
    private readonly UserService _userService;

    public ClientAuthenticateWithJwt(TokenService tokenService, UserService userService)
    {
        _tokenService = tokenService;
        _userService = userService;
    }

    public override Task Handle(ClientAuthenticateWithJwtDto dto, IWebSocketConnection socket)
    {
        _tokenService.ValidateJwtAndReturnClaims(dto.Jwt);
        var user = _userService.GetUser(dto.User);
        
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = true;
        StateService.GetClient(socket.ConnectionInfo.Id).user = user;
        
        var responseDto = new ResponseDto()
        {
            ResponseData = user,
            Jwt = dto.Jwt
        };


        socket.Send(JsonSerializer.Serialize(new ServerAuthenticatesUser()
        {
            ResponseDto = responseDto
        }, new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        }));
        return Task.CompletedTask;
    }
}