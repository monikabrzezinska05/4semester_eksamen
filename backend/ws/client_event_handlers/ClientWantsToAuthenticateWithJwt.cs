using System.ComponentModel.DataAnnotations;
using api;
using Fleck;
using infrastructure.repositories;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToAuthenticateWithJwtDto : BaseDto
{
    [Required] public string? jwt { get; set; }
}

[ValidateDataAnnotations]
public class ClientWantsToAuthenticateWithJwt(UserRepository userRepository, TokenService tokenService)
    : BaseEventHandler<ClientWantsToAuthenticateWithJwtDto>
{
    public override async Task Handle(ClientWantsToAuthenticateWithJwtDto dto, IWebSocketConnection socket)
    {
        var claims = tokenService.ValidateJwtAndReturnClaims(dto.jwt!);
        var user = userRepository.GetUserByMail(claims["email"]);

        StateService.GetClient(socket.ConnectionInfo.Id).user = user;
        StateService.GetClient(socket.ConnectionInfo.Id).IsAuthenticated = true;
        socket.SendDto(new ServerAuthenticatesUserFromJwt());
    }
}