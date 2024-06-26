namespace infrastructure.models;

public class Unit
{
    public int UnitId { get; set; }
    public string Name { get; set; }
    public Status Status { get; set; }
    public UnitType UnitType { get; set; }
}

public enum Status
{
    Armed,
    Disarmed,
    Triggered,
    Closed,
    Opened
}

public enum UnitType
{
    Door,
    Window,
    MotionSensor,
}