using infrastructure.models;
using infrastructure.repositories;
using MailKit.Net.Smtp;
using MimeKit;

namespace service;

public class EmailService
{
    private EmailRepository _emailRepository;

    public EmailService(EmailRepository emailRepository)
    {
        _emailRepository = emailRepository;
    }

    public void SendEmail(HistoryModel history, Unit unit)
    {
        var message = new MimeMessage();
        message.From.Add(new MailboxAddress("Securty", Environment.GetEnvironmentVariable("fromEmail")));

        message.Subject = "Alarm triggered";
        message.Body = new TextPart("plain")
        {
            Text = @$"{unit.Name} has been triggered at: {history.Date}.


Best Regards, Securty Home Security"
        };
        foreach (var email in getMails().ToList())
        {
            message.To.Add(new MailboxAddress(email.mail, email.mail));
            using (var client = new SmtpClient())
            {
                client.Connect("smtp.gmail.com", 465, true);
                client.Authenticate(Environment.GetEnvironmentVariable("fromEmail"),
                    Environment.GetEnvironmentVariable("fromPass"));
                client.Send(message);
                client.Disconnect(true);
            }
        }
    }

    public IEnumerable<EmailModel> getMails()
    {
        return _emailRepository.getMails();
    }

    public EmailModel createEmail(EmailModel model)
    {
        return _emailRepository.createEmail(model);
    }

    public bool deleteEmail(int id)
    {
        return _emailRepository.deleteEmail(id);
    }
}