namespace infrastructure.models;

public class PasswordModel
{
    public string Mail { get; set; }
    
    public required string Password { get; set; }
    
    public required string Salt { get; set; }
}