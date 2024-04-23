namespace infrastructure.models;

public class PasswordModel
{
    public int UserID { get; set; }
    
    public required string Password { get; set; }
    
    public required string Salt { get; set; }
}