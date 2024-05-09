using infrastructure.models;
using infrastructure.repositories;
using service.PasswordHashing;

namespace service;

public class UserService
{
    private readonly UserRepository _userRepository;
    private readonly HashingArgon2id _hashingArgon2Id;
    
    public UserService(UserRepository userRepository, HashingArgon2id hashingArgon2Id)
    {
        _userRepository = userRepository;
        _hashingArgon2Id = hashingArgon2Id;
    }
    
    
    public User CreateUser(User user, string password)
    {
        var salt = _hashingArgon2Id.GenerateSalt();
        var hash = _hashingArgon2Id.HashPassword(password, salt);

        var newUser = _userRepository.CreateUser(user);
        _userRepository.CreatePassword(hash, salt, newUser.Mail);
        return newUser;
    }
}