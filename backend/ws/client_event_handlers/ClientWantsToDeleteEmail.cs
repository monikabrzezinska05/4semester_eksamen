﻿using System.Text.Json;
using api.transfer_models;
using Fleck;
using infrastructure.models;
using lib;
using service;
using ws.transfer_models.server_models;

namespace ws.client_event_handlers;

public class ClientWantsToDeleteEmailDto : BaseDto
{
    public EmailModel EmailModel { get; set; }
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
        int emailId = dto.EmailModel.id;
        
        bool loggedEvent = _emailService.deleteEmail(emailId);
        var deleteEmail = new ResponseDto()
        {
            ResponseData = loggedEvent
        };
        var deleteEmailToClient = JsonSerializer.Serialize(new ServerShowsEmailList()
        {
            ResponseDto = deleteEmail
        });
        socket.Send(deleteEmailToClient);
        return Task.CompletedTask;
    }
}