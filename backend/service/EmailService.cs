using infrastructure.models;
using infrastructure.repositories;
using MailKit.Net.Smtp;
using MimeKit;

namespace service;

public class EmailService
{
    public static void SendEmail(string toEmail, HistoryModel history, Unit unit)
    {
        var message = new MimeMessage();
        message.From.Add(new MailboxAddress("Securty", Environment.GetEnvironmentVariable("fromEmail")));
        message.To.Add(new MailboxAddress(toEmail,toEmail));
        message.Subject = "Alarm triggered";

        message.Body = new TextPart("plain")
        {
            Text = @$"{unit.Name} has been triggered at: {history.Date}.


Best Regards, Securty"

        };

        using (var client = new SmtpClient())
        {
            client.Connect("smtp.gmail.com", 465, true);
            client.Authenticate(Environment.GetEnvironmentVariable("fromEmail"), Environment.GetEnvironmentVariable("fromPass"));
            client.Send(message);
            client.Disconnect(true);
        }
    }
}

//todo Liste med email, navn og id, fetch liste i database hver gang jeg vil sende mail. Få mail service til at hente det fra databasen
//Hent liste fra database, loop igennem liste for at sende mail?