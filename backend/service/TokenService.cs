using System.Security.Authentication;
using infrastructure.models;
using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
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
            var now = provider.GetNow().AddMinutes(-5);

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
            var provider = new UtcDateTimeProvider();
            IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
            IJwtValidator validator = new JwtValidator(serializer, provider);
            IJwtDecoder decoder = new JwtDecoder(serializer, validator, urlEncoder, new HMACSHA512Algorithm());
            Console.WriteLine("before decode");
            var json = decoder.Decode(jwt, jwtKey);
            Console.WriteLine("after decode");
            
            /*var claims = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
            if (claims.TryGetValue("exp", out string expValue))
            {
                var expDate = DateTimeOffset.FromUnixTimeSeconds(long.Parse(expValue));
                Console.WriteLine("tester 1");
                return expDate.UtcDateTime <= DateTime.UtcNow.AddHours(-2);
            }
            else
            {
                throw new Exception("JWT does not contain 'exp' claim.");
            }
           */
            return true;
        }
        catch (Exception e)
        {
            Log.Error(e, "ValidateJwtAndReturnClaims");
            return false;
        }
    }
}