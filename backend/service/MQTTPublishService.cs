using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Formatter;

namespace service;

public class MQTTPublishService
{
    public async Task AlarmTurnOffPublish()
    {
        var mqttFactory = new MqttFactory();
        var mqttClient = mqttFactory.CreateMqttClient();

        var mqttClientOptions = new MqttClientOptionsBuilder()
            .WithTcpServer("mqtt.flespi.io", 8883)
            .WithProtocolVersion(MqttProtocolVersion.V500)
            .WithTls()
            .WithCredentials(Environment.GetEnvironmentVariable("mqttToken"))
            .Build();

        await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

        var json =
            @"{
            ""Payload"": ""OFF""
            }";

        var alarmOff = new MqttApplicationMessageBuilder()
            .WithTopic("Security/Alarm/1")
            .WithPayload(json)
            .Build();

        await mqttClient.PublishAsync(alarmOff, CancellationToken.None);

        await mqttClient.DisconnectAsync();

        Console.WriteLine("Alarm turn off has been published");
    }

    public async Task AlarmTurnOnPublish()
    {
        var mqttFactory = new MqttFactory();
        var mqttClient = mqttFactory.CreateMqttClient();

        var mqttClientOptions = new MqttClientOptionsBuilder()
            .WithTcpServer("mqtt.flespi.io", 8883)
            .WithProtocolVersion(MqttProtocolVersion.V500)
            .WithTls()
            .WithCredentials(Environment.GetEnvironmentVariable("mqttToken"))
            .Build();

        await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

        var json =
            @"{
            ""Payload"": ""ON""
            }";

        var alarmOn = new MqttApplicationMessageBuilder()
            .WithTopic("Security/Alarm/1")
            .WithPayload(json)
            .Build();

        await mqttClient.PublishAsync(alarmOn, CancellationToken.None);

        await mqttClient.DisconnectAsync();

        Console.WriteLine("Alarm turn on has been published");
    }

    public async Task AlarmTurnOffMotionPublish()
    {
        var mqttFactory = new MqttFactory();
        var mqttClient = mqttFactory.CreateMqttClient();

        var mqttClientOptions = new MqttClientOptionsBuilder()
            .WithTcpServer("mqtt.flespi.io", 8883)
            .WithProtocolVersion(MqttProtocolVersion.V500)
            .WithTls()
            .WithCredentials(Environment.GetEnvironmentVariable("mqttToken"))
            .Build();

        await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

        var json =
            @"{
            ""Payload"": ""OFF""
            }";

        var alarmOff = new MqttApplicationMessageBuilder()
            .WithTopic("Security/Motion/Toggle")
            .WithPayload(json)
            .Build();

        await mqttClient.PublishAsync(alarmOff, CancellationToken.None);

        await mqttClient.DisconnectAsync();

        Console.WriteLine("Alarm turn off has been published");
    }

    public async Task AlarmTurnOnMotionPublish()
    {
        var mqttFactory = new MqttFactory();
        var mqttClient = mqttFactory.CreateMqttClient();

        var mqttClientOptions = new MqttClientOptionsBuilder()
            .WithTcpServer("mqtt.flespi.io", 8883)
            .WithProtocolVersion(MqttProtocolVersion.V500)
            .WithTls()
            .WithCredentials(Environment.GetEnvironmentVariable("mqttToken"))
            .Build();

        await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

        var json =
            @"{
            ""Payload"": ""ON""
            }";

        var alarmOn = new MqttApplicationMessageBuilder()
            .WithTopic("Security/Motion/Toggle")
            .WithPayload(json)
            .Build();

        await mqttClient.PublishAsync(alarmOn, CancellationToken.None);

        await mqttClient.DisconnectAsync();

        Console.WriteLine("Alarm turn on has been published");
    }
}