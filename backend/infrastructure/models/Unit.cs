namespace infrastructure.models;

public class Unit
{
    public int UnitId { get; set; }
    public string Name { get; set; }
    public Status Status { get; set; }
    public UnitType UnitTypeId { get; set; }
}

public enum Status
{
    Armed,
    Disarmed,
    Triggered,
}

public enum UnitType
{
    Door,
    Window,
    MotionSensor,
}