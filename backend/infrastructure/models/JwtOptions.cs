namespace infrastructure.models;

public class JwtOptions
{
    public required byte[] Secret { get; init; }
    public required TimeSpan Lifetime { get; init; }
    public string? Address { get; set; }
    public string Audience { get; set; }
    
    private JwtOptions()
    {
    }

    public static JwtOptions create(byte[] secret, TimeSpan lifetime, string audience)
    {
        return new JwtOptions
        {
            Secret = secret,
            Lifetime = lifetime,
            Audience = audience
        };
    }
}