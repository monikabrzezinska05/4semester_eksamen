using System.Text.Json;
using Fleck;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToSeeEmailsDto : BaseDto { }

public class ClientWantsToSeeEmails : BaseEventHandler<ClientWantsToSeeEmailsDto>
{
    private readonly EmailService _emailService;
    
    public ClientWantsToSeeEmails(EmailService emailService)
    {
        _emailService = emailService;
    }
    
    public override Task Handle(ClientWantsToSeeEmailsDto dto, IWebSocketConnection socket)
    {
        StateService.IsClientAuthenticated(socket.ConnectionInfo.Id);
        var emails = _emailService.GetMails().ToList();
        
        var response = new ServerShowsEmails()
        {
            Emails = emails
        };
        
        socket.Send(JsonSerializer.Serialize(response, StateService.JsonOptions()));
        return Task.CompletedTask;
    }
}