namespace infrastructure.models;

public class SessionData
{
    public string UserMail { get; set; }
    public bool IsChild { get; set; }

    public static SessionData FromUser(User user)
    {
        bool isChild = user.IsChild;
        return new SessionData { UserMail = user.Mail, IsChild = isChild };
    }

    public static SessionData FromDictionary(Dictionary<string, object> dict)
    {
        return new SessionData { UserMail = (string)dict[Keys.UserMail], IsChild = (bool)dict[Keys.IsChild]};
    }

    public Dictionary<string, object> ToDictionary()
    {
        return new Dictionary<string, object> { { Keys.UserMail, UserMail }, { Keys.IsChild, IsChild } };
    }

    public static class Keys
    {
        public const string UserMail = "u";
        public const string IsChild = "a";
    }
}