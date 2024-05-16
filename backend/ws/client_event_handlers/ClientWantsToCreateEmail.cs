using System.Text.Json;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToCreateEmailDto : BaseDto
{
    public EmailModel EmailModel { get; set; }
}

public class ClientWantsToCreateEmail : BaseEventHandler<ClientWantsToCreateEmailDto>
{
    private readonly EmailService _emailService;

    public ClientWantsToCreateEmail(EmailService emailService)
    {
        _emailService = emailService;
    }

    public override Task Handle(ClientWantsToCreateEmailDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        EmailModel loggedEvent = _emailService.CreateEmail(dto.EmailModel);

        var newEmailToClient = JsonSerializer.Serialize(new ServerCreatesEmail()
            {
                Email = loggedEvent
            },
            StateService.JsonOptions()
        );
        socket.Send(newEmailToClient);
        return Task.CompletedTask;
    }
}