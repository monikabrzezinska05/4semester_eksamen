import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/authentication_bloc/authentication_cubit.dart';
import 'package:mob_dev/main.dart';

import 'authentication_bloc/authentication_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onSignIn() {
      if (!_authFormKey.currentState!.validate()) return;
      context
          .read<AuthenticationCubit>()
          .login(_usernameController.text, _passwordController.text);
    }

    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listenWhen: (previous, current) => current.isAuthenticated == true,
        listener: (context, state) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()));
        },
        builder: (context, state) {
          return Form(
              key: _authFormKey,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.orange.shade900,
                      Colors.yellow.shade600,
                      Colors.yellow.shade400
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    const Header(),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black // Dark theme background color
                              : Colors.white, // Light theme background color
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 60),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: <Widget>[
                                  EmailField(
                                      usernameController:
                                      _usernameController,
                                      authFormKey: _authFormKey),
                                  PasswordField(
                                      passwordController:
                                      _passwordController,
                                      authFormKey: _authFormKey),
                                ]),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: onSignIn,
                                    child: const Text("Sign in",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),);
        },),);
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required TextEditingController passwordController,
    required GlobalKey<FormState> authFormKey,
  })
      : _passwordController = passwordController,
        _authFormKey = authFormKey;

  final TextEditingController _passwordController;
  final GlobalKey<FormState> _authFormKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your password",
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.all(20)),
        controller: _passwordController,
        obscureText: true,
        onChanged: (value) => _authFormKey.currentState!.validate(),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required TextEditingController usernameController,
    required GlobalKey<FormState> authFormKey,
  })
      : _usernameController = usernameController,
        _authFormKey = authFormKey;

  final TextEditingController _usernameController;
  final GlobalKey<FormState> _authFormKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your email",
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.all(20)),
        controller: _usernameController,
        onChanged: (value) => _authFormKey.currentState!.validate(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AppBar(
        toolbarHeight: 250,
        title: Column(
          children: [
            SizedBox(
              height: 180,
              child: Image.asset(
                'assets/securty_logo.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            const Text('Log into your Securty System!',
                style: TextStyle(fontSize: 28, color: Colors.black)),
            ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),);
  }
}
