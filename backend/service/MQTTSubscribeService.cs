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
            .WithCredentials(Environment.GetEnvironmentVariable("mqttToken"))
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
                var deserialized = JsonSerializer.Deserialize<Root>(message);
                switch (deserialized.eventType)
                {
                    case "ClientSensesMotion":
                        _mediatr.Publish(new SensingMotionMediatRDto
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientStopsSensingMotion":
                        _mediatr.Publish(new StopsSensingMotionMediatRDto()
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientOpensWindowDoor":
                        _mediatr.Publish(new OpensWindowDoorMediatRDto()
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientClosesWindowDoor":
                        _mediatr.Publish(new ClosesWindowDoorMediatRDto()
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientWantsToTurnOnAlarm":
                        _mediatr.Publish(new TurnsOnAlarmMediatRDto()
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientWantsToTurnOffAlarm":
                        _mediatr.Publish(new TurnsOffAlarmMediatRDto()
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientWantsToTurnOnMotionAlarm":
                        _mediatr.Publish(new TurnsOnMotionAlarmMediatRDto()
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientWantsToTurnOffMotionAlarm":
                        _mediatr.Publish(new TurnsOffMotionAlarmMediatRDto()
                        {
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientLocksDoor":
                        _mediatr.Publish(new LocksDoorMediatRDto()
                        {
                            rfid = deserialized.rfid,
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientUnlocksDoor":
                        _mediatr.Publish(new UnlocksDoorMediatRDto()
                        {
                            rfid = deserialized.rfid,
                            historyModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                    case "ClientTriggersAlarm":
                        _mediatr.Publish(new AlarmTriggerMediatRDto()
                        {
                            HistoryModel = new HistoryModel
                            {
                                UnitId = deserialized.historyModel!.unitId,
                                Date = DateTime.Now,
                                EventType = (EventType)deserialized.historyModel.eventTypeId
                            }
                        });
                        break;
                }
            }
            catch (Exception exc)
            {
                Console.WriteLine(exc);
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
    public string? rfid { get; set; }
}