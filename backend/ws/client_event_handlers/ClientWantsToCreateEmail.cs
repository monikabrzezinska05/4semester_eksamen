using System.Text.Json;
using api.transfer_models;
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
        EmailModel loggedEvent = _emailService.createEmail(dto.EmailModel);
        var newEmail = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var newEmailToClient = JsonSerializer.Serialize(new ServerShowsEmailList()
        {
            ResponseDto = newEmail
        });
        socket.Send(newEmailToClient);
        return Task.CompletedTask;
    }
}