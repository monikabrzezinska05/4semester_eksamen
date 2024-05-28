import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/authentication_bloc/authentication_state.dart';
import 'package:mob_dev/models/user/user_model.dart';

import '../main.dart';
import '../models/events/events_model.dart';
import '../models/user_login/user_login_model.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final BroadcastWsChannel wsChannel;

  AuthenticationCubit(this.wsChannel) : super(AuthenticationState.initial()) {
    wsChannel.stream.listen((event) {
      switch (event) {
        case ServerAuthenticatesUser(
            eventType: _,
            user: var model,
            jwt: var jwt
          ):
          _onAuthentication(model, jwt);
        case ServerDeAuthenticatesUser(eventType: _):
          _onDeAuthentication();
      }
    }, onError: (error) {
      //DO SOMETHING HERE
      print('Error: $error');
    });
  }

  Future<void> init() async {}

  login(String email, String password) {
    _send(ClientWantsToLogin(
      eventType: ClientWantsToLogin.name,
      userLogin: UserLoginModel(email: email, password: password),
    ));
  }

  void _onDeAuthentication() {
    _send(ClientWantsToDeAuthenticate(eventType: ClientWantsToDeAuthenticate.name));
    emit(state.copyWith(user: null, jwt: null, isAuthenticated: false));
  }

  void _onAuthentication(UserModel model, String jwt) {
    emit(state.copyWith(user: model, jwt: jwt, isAuthenticated: true));
  }

  _send(ClientEvent event) {
    wsChannel.sink.add(jsonEncode(event.toJson()));
  }

  void deAuthenticateUser() {
    _onDeAuthentication();
  }
}
