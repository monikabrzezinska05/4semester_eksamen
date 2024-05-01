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
    
    public User? Authenticate(UserLogin userLogin)
    {
        try
        {
            Console.WriteLine("String med hvad jeg skriver" + userLogin.Email);
            var pwHash = _authenticateRepository.GetUserByEmail(userLogin.Email);
            var hashAlgorithm = new HashingArgon2id();
            var isValid =
                hashAlgorithm.VerifyHashedPassword(userLogin.Password, pwHash.Password, pwHash.Salt);
            if (isValid)
            {
                Console.WriteLine("email numero dos" + userLogin.Email);
                return _userRepository.GetUserByMail(userLogin.Email);
            }
        }
        catch (Exception e)
        {
            _logger.LogError("Authentication error: {Message}", e);
        }

        return null;
    }
}