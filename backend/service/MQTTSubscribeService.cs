using System.Text.Json;
using infrastructure;
using infrastructure.models;
using MediatR;
using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Formatter;
using JsonSerializer = System.Text.Json.JsonSerializer;

namespace service;  

public class MQTTSubscribeService
{
    private readonly HistoryService _historyService;
    private readonly Mediator _mediatr;

    public MQTTSubscribeService(HistoryService historyService, Mediator mediator)
    {
        _historyService = historyService;
        _mediatr = mediator;
    }

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
                var message = receivedMessage.ApplicationMessage.ConvertPayloadToString();
                Console.WriteLine(message);
                var deserialized = JsonSerializer.Deserialize<Root>(message);
                //Console.WriteLine(JsonSerializer.Serialize(deserialized));
                Console.WriteLine(deserialized.eventType);
                switch (deserialized.eventType)
                {
                    case "ClientOpensWindowDoor" :
                        _mediatr.Publish(new SensingMotionMediatRDto
                        {
historyModel = 
                        });
                }


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

