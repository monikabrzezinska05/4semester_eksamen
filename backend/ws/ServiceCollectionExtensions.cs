using System.Text;
using infrastructure.models;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Hosting.Server.Features;
using service;

namespace api;

public static class ServiceCollectionExtensions
{
    public static void AddJwtService(this IServiceCollection services)
    {
        services.AddSingleton<JwtOptions>(services =>
        {
            var configuration = services.GetRequiredService<IConfiguration>();

            byte[] secret = Encoding.UTF8.GetBytes(Environment.GetEnvironmentVariable("JwtSecret")!);
            TimeSpan lifetime = TimeSpan.Parse(configuration["JWT:Lifetime"]!);
            string audience = configuration["JWT:Audience"]!;

            var options = JwtOptions.create(secret, lifetime, audience);

            if (string.IsNullOrEmpty(options?.Address))
            {
                var server = services.GetRequiredService<IServer>();
                var addresses = server.Features.Get<IServerAddressesFeature>()?.Addresses;

                options.Address = addresses?.FirstOrDefault();
            }

            return options;
        });

        services.AddSingleton<JwtService>();
    }
}