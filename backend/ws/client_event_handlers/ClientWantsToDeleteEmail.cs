using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToDeleteEmailDto : BaseDto
{
    public int EmailId { get; set; }
}

public class ClientWantsToDeleteEmail : BaseEventHandler<ClientWantsToDeleteEmailDto>
{
    private readonly EmailService _emailService;

    public ClientWantsToDeleteEmail(EmailService emailService)
    {
        _emailService = emailService;
    }

    public override Task Handle(ClientWantsToDeleteEmailDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        var emailDeleted = _emailService.DeleteEmail(dto.EmailId);

        var deleteEmailToClient = JsonSerializer.Serialize(new ServerDeletesEmail()
            {
                Success = emailDeleted,
                EmailId = dto.EmailId
            },
            StateService.JsonOptions()
        );

        socket.Send(deleteEmailToClient);
        return Task.CompletedTask;
    }
}