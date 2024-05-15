using System.Text.Json;
using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Formatter;
using Newtonsoft.Json;
using service.mqtt_dto;
using JsonSerializer = System.Text.Json.JsonSerializer;

namespace service;

public class MQTTSubscribeService
{
    public async Task CommunicateWithBroker()
    {
        var mqttFactory = new MqttFactory();
        var mqttClient = mqttFactory.CreateMqttClient();

        //Connection options til flespi med brug af token.
        var mqttClientOptions = new MqttClientOptionsBuilder()
            .WithTcpServer("mqtt.flespi.io", 8883)
            .WithProtocolVersion(MqttProtocolVersion.V500)
            .WithTls()
            .WithCredentials(Environment.GetEnvironmentVariable("mqttToken"))//Change to real token.
            .Build();

        //Connect med options.
        await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

        //Subscribe options til topic.
        var mqttSubscribeOptions = mqttFactory.CreateSubscribeOptionsBuilder()
            .WithTopicFilter(filter => filter.WithTopic("Security/#"))
            .Build();

        //Subscribe til topic.
        await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

        //Vent async til at få en besked.
        mqttClient.ApplicationMessageReceivedAsync += receivedMessage =>
        {
            try
            {
                //Få beskeden.
                var message = JsonSerializer.Serialize(receivedMessage.ApplicationMessage.ConvertPayloadToString());
          //    var message = "{\n    \"eventType\": \"ClientClosesWindowDoor\",\n    \"historyModel\" : {\n        \"userEmail\": \"boobie@email.dk\",\n        \"unitId\" : 1,\n        \"date\" : \"2024-04-30\",\n        \"eventTypeId\" : 1\n    }\n}";
                Console.WriteLine(message);
        

             //   var str ="{\n    \"eventType\": \"ClientClosesWindowDoor\",\n    \"historyModel\" : {\n        \"userEmail\": \"boobie@email.dk\",\n        \"unitId\" : 1,\n        \"date\" : \"2024-04-30\",\n        \"eventTypeId\" : 1\n    }\n}";
            
                var deMessage = JsonConvert.DeserializeObject<Root>(message);

            //    var deMessage = JsonSerializer.Deserialize<Root>(JSONresult);
                Console.WriteLine("Message: " + deMessage.eventType);
                Console.WriteLine("Received message: " + receivedMessage.ApplicationMessage.ConvertPayloadToString());
                Console.WriteLine("Application message test 2: " + receivedMessage.ApplicationMessage.Topic);
            }
            catch (Exception exc)
            {
                Console.WriteLine(exc.Message);
                Console.WriteLine(exc.InnerException);
                Console.WriteLine(exc.StackTrace);
            }

            return Task.CompletedTask;
        };

    }
}

// Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
public class HistoryModelD
{
    public string userEmail { get; set; }
    public int unitId { get; set; }
   // public string date { get; set; }
    public int eventTypeId { get; set; }
}

public class Root
{
    public string? eventType { get; set; }
    public HistoryModelD? historyModel { get; set; }
}

