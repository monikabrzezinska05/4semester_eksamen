using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerShowsEmails : BaseDto
{
    public List<EmailModel> Emails { get; set; }
}