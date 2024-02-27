import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:meastro_sample/project/home_view.dart';
import 'package:meastro_sample/project/identifier_keys.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with _LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('vb10 login'),
        actions: [
          Semantics(
              identifier: IdentifierKeys.loginCloseButton.name,
              child: const CloseButton())
        ],
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => _EmailValidator(value: value).validate,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) =>
                    _PasswordValidator(value: value).validate),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.route.navigateToPage(const HomeView());
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

mixin _LoginViewMixin on State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }
}

abstract interface class Validator {
  Validator({required this.value});

  String? get validate;
  final String? value;
}

final class _EmailValidator extends Validator {
  _EmailValidator({required super.value});

  @override
  String? get validate {
    if (value == null || value!.isEmpty) {
      return 'Please enter some text';
    }
    if (!value!.ext.isValidEmail) {
      return 'Please enter a valid email';
    }
    return null;
  }
}

final class _PasswordValidator extends Validator {
  _PasswordValidator({required super.value});

  @override
  String? get validate {
    if (value == null || value!.isEmpty) {
      return 'Please enter some text';
    }
    if (value!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}
