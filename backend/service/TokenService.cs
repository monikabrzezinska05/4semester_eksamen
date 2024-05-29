using infrastructure.models;
using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using Microsoft.Extensions.Configuration;
using Serilog;

namespace service;

public class TokenService(IConfiguration configuration)
{
    private readonly string jwtKey = configuration.GetValue<string>("JWT_KEY");
    
    public string IssueJwt(User user)
    {
        try
        {
            IDateTimeProvider provider = new UtcDateTimeProvider();
            var now = provider.GetNow().AddMinutes(60);

            double seconds = UnixEpoch.GetSecondsSince(now);
            
            var payload = new Dictionary<string, object>
            {
                {"user", user},
                {"exp", seconds}
            };
            
            IJwtAlgorithm algorithm = new HMACSHA512Algorithm();
            IJsonSerializer serializer = new JsonNetSerializer();
            IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
            IJwtEncoder encoder = new JwtEncoder(algorithm, serializer, urlEncoder);
            return encoder.Encode(payload, jwtKey);
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            Log.Error(e, "IssueJWT");
            throw new InvalidOperationException();
        }
    }

    public bool ValidateJwtAndReturnClaims(string jwt)
    {
        try
        {
            IJsonSerializer serializer = new JsonNetSerializer();
            IJwtAlgorithm algorithm = new HMACSHA512Algorithm();
            IDateTimeProvider provider = new UtcDateTimeProvider();
            IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
            IJwtValidator validator = new JwtValidator(serializer, provider);
            IJwtDecoder decoder = new JwtDecoder(serializer, validator, urlEncoder, algorithm);
            
            decoder.Decode(jwt, jwtKey);
            return true;
        }
        catch (Exception e)
        {
            Log.Error(e, "ValidateJwtAndReturnClaims");
            return false;
        }
    }
}