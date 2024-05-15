using infrastructure.models;

namespace service.mqtt_dto;

public class MQTTDto
{
    public string EventType { get; set; }
    public string? RFID { get; set; }
    public HistoryModel HistoryModel { get; set; }
}