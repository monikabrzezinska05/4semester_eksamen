import 'package:mob_dev/models/user/user_model.dart';

class AuthenticationState {
  final bool isAuthenticated;
  final String jwt;
  final UserModel user;

  const AuthenticationState({
    required this.isAuthenticated,
    required this.jwt,
    required this.user,
  });

  factory AuthenticationState.initial() {
    return AuthenticationState(
      isAuthenticated: false,
      jwt: '',
      user: UserModel(name: '', mail: '', isChild: false)
    );
  }

  AuthenticationState copyWith({
    bool? isAuthenticated,
    String? jwt,
    UserModel? user,
  }) {
    return AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      jwt: jwt ?? this.jwt,
      user: user ?? this.user,
    );
  }
}