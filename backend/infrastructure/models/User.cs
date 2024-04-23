namespace infrastructure.models;

public class User
{
    public int? UserId { get; set; }
    public string name { get; set; }
    public string email { get; set; }
    public bool isChild { get; set; }
}