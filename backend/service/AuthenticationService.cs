using infrastructure.models;
using infrastructure.repositories;
using Microsoft.Extensions.Logging;
using service.PasswordHashing;

namespace service;

public class AuthenticationService
{
    private readonly AuthenticateRepository _authenticateRepository;
    private readonly UserRepository _userRepository;
    private readonly ILogger<AuthenticationService> _logger;
    
    public AuthenticationService(AuthenticateRepository authenticateRepository, UserRepository userRepository, ILogger<AuthenticationService> logger)
    {
        _authenticateRepository = authenticateRepository;
        _userRepository = userRepository;
        _logger = logger;
    }
    
    public User? Authenticate(String email, String password)
    {
        try
        {
            Console.WriteLine("im in");
            var pwHash = _authenticateRepository.GetUserByEmail(email);
            Console.WriteLine("Hash: " + pwHash.salt);
            var hashAlgorithm = new HashingArgon2id();
            var isValid =
                hashAlgorithm.VerifyHashedPassword(password, pwHash.password, pwHash.salt);
            if (isValid)
            {
                Console.WriteLine("email numero dos" + email);
                return _userRepository.GetUserByMail(email);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            _logger.LogError("Authentication error: {Message}", e);
        }

        return null;
    }
}