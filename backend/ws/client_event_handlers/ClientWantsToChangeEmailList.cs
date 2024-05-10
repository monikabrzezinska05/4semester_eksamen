using Fleck;
using lib;
using service;

namespace ws;

public class ClientWantsToChangeEmailListDto : BaseDto
{
    private readonly EmailService _emailService;

    public ClientWantsToChangeEmailListDto(EmailService emailService)
    {
        _emailService = emailService;
    }
}

public class ClientWantsToChangeEmailList : BaseEventHandler<ClientWantsToChangeEmailListDto>
{
    public override Task Handle(ClientWantsToChangeEmailListDto dto, IWebSocketConnection socket)
    {
        throw new NotImplementedException();
    }
}
