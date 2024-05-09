using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Formatter;
using Newtonsoft.Json;

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
            .WithTopicFilter(f => f.WithTopic("Security/#"))
            .Build();

        //Subscribe til topic.
        await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

        //Vent async til at få en besked.
        mqttClient.ApplicationMessageReceivedAsync += async e =>
        {
            try
            {
                //Få beskeden.
                var message = e.ApplicationMessage.ConvertPayloadToString();

                //Check at der er en connection.
                if (StateService.Connections != null && StateService.Connections.Any())
                {
                    //Få en connection.
                    var connection = StateService.Connections.FirstOrDefault().Value;
                    
                    if (connection != null)
                    {
                        //Serialize til json object og send det!
                        var jsonObj = JsonConvert.SerializeObject(message);
                        connection.OnMessage.Invoke(jsonObj);
                        Console.WriteLine("Message sent!");
                    }
                    else
                    {
                        Console.WriteLine("Connection is null.");
                    }
                }
                else
                {
                    Console.WriteLine("No connections available.");
                }
                
            }
            catch (Exception exc)
            {
                Console.WriteLine(exc.Message);
                Console.WriteLine(exc.InnerException);
                Console.WriteLine(exc.StackTrace);
            }
        };
    }
}