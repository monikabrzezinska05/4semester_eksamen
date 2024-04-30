using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Formatter;
using Newtonsoft.Json;

namespace service;

public class MQTTService
{
    public async Task CommunicateWithBroker()
    {
        var mqttFactory = new MqttFactory();
        var mqttClient = mqttFactory.CreateMqttClient();

        var mqttClientOptions = new MqttClientOptionsBuilder()
            .WithTcpServer("mqtt.flespi.io", 8883)
            .WithProtocolVersion(MqttProtocolVersion.V500)
            .WithTls()
            .WithCredentials("ysMQYbHHGzdTMuiSwz5a3RtqiRbP1hPFva5Vua1g4W9QdAv2TtQ0IJnwulHd4YQe")//Change to real token.
            .Build();

        await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

        var mqttSubscribeOptions = mqttFactory.CreateSubscribeOptionsBuilder()
            .WithTopicFilter(f => f.WithTopic("Security/#"))
            .Build();

        await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

        mqttClient.ApplicationMessageReceivedAsync += async e =>
        {
            try
            {
                var message = e.ApplicationMessage.ConvertPayloadToString();
                Console.WriteLine("Received message: " + message);
                var json = JsonConvert.DeserializeObject(message);

                if (StateService.Connections != null && StateService.Connections.Any())
                {
                    var connection = StateService.Connections.FirstOrDefault().Value;
                    
                    if (connection != null)
                    {
                        var jsonObj = JsonConvert.SerializeObject(message);
                        //await connection.Send(jsonObj);
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