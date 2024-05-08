namespace infrastructure.models;

public class PasswordModel
{
    public string useremail { get; set; }
    
    public required string password { get; set; }
    
    public required string salt { get; set; }
}