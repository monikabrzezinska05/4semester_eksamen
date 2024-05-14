using System.Text.Json;
using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Formatter;

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
                var message = receivedMessage.ApplicationMessage.ConvertPayloadToString();
                Console.WriteLine("Received message" + message);

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