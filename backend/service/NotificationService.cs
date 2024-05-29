using CorePush.Firebase;

namespace service
{
    public class Message
    {
        public string? token { get; set; }
        public Notification notification { get; set; }
    }

    public class Notification
    {
        public string title { get; set; }
        public string body { get; set; }
    }

    public class RootOfNotification
    {
        public Message message { get; set; }
    }
    
    public static class NotificationService
    {
        public static async void SendNotification(List<string> tokens)
        {
            var payload = new RootOfNotification
            {
                message = new Message
                {
                    notification = new Notification
                    {
                        title = "Alarm triggered!",
                        body = "An alarm has been triggered! Open your app to see more details."
                    }
                }
            };
            HttpClient httpClient = new HttpClient();
            var firebaseSettingsJson = await File.ReadAllTextAsync("../firebase_key.json");
            var fcm = new FirebaseSender(firebaseSettingsJson, httpClient);
            
            foreach (var token in tokens)
            {
                payload.message.token = token;
                await fcm.SendAsync(payload);
            }
        }
    }
}