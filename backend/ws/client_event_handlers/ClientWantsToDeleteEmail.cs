using Fleck;
using lib;
using service;

namespace ws.client_event_handlers;

public class ClientWantsToDeleteEmailDto : BaseDto
{
    private readonly EmailService _emailService;

    public ClientWantsToDeleteEmailDto(EmailService emailService)
    {
        _emailService = emailService;
    }
}

public class ClientWantsToDeleteEmail : BaseEventHandler<ClientWantsToDeleteEmailDto>
{
    public override Task Handle(ClientWantsToDeleteEmailDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}