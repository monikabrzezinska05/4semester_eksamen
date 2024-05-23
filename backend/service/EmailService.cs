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
        Console.WriteLine("from sendemail");
        var message = new MimeMessage();
        message.From.Add(new MailboxAddress("Securty", Environment.GetEnvironmentVariable("fromEmail")));

        Console.WriteLine(Environment.GetEnvironmentVariable("fromEmail") + "variable");
        
        message.Subject = "Alarm triggered";
        message.Body = new TextPart("plain")
        {
            Text = @$"{unit.Name} has been triggered at: {history.Date}.


Best Regards, Securty Home Security"
        };
        Console.WriteLine("somewhere idk");

        foreach (var email in GetMails().ToList())
        {
            Console.WriteLine("from the loop");
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

    public IEnumerable<EmailModel> GetMails()
    {
        return _emailRepository.getMails();
    }

    public EmailModel CreateEmail(string mail)
    {
        return _emailRepository.createEmail(mail);
    }

    public bool DeleteEmail(int? id)
    {
        return _emailRepository.deleteEmail(id);
    }
}