import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/authentication_bloc/authentication_cubit.dart';

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
    _onSignIn() {
      if (!_authFormKey.currentState!.validate()) return;
      context.read<AuthenticationCubit>().login(
          _usernameController.text, _passwordController.text);
    }

    return Form(
      key: _authFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            controller: _usernameController,
            validator: (value) =>
            (value ?? "").contains("@") ? null : "Must be a valid email",
            onChanged: (value) => _authFormKey.currentState!.validate(),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            controller: _passwordController,
            obscureText: true,
            validator: (value) => (value ?? "").length >= 6
                ? null
                : "Must be at least 6 in length",
            onChanged: (value) => _authFormKey.currentState!.validate(),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              OutlinedButton(
                  onPressed: _onSignIn, child: const Text("Sign in")),
            ],
          )
        ],
      ),
    );
  }
}
