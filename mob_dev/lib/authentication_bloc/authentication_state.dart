class AuthenticationState {
  final bool isAuthenticated;
  final String jwt;
  final String email;

  const AuthenticationState({
    required this.isAuthenticated,
    required this.jwt,
    required this.email,
  });

  factory AuthenticationState.initial() {
    return AuthenticationState(
      isAuthenticated: false,
      jwt: '',
      email: '',
    );
  }

  AuthenticationState copyWith({
    bool? isAuthenticated,
    String? jwt,
    String? email,
  }) {
    return AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      jwt: jwt ?? this.jwt,
      email: email ?? this.email,
    );
  }
}