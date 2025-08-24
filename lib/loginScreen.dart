import 'package:flutter/material.dart';

import 'loginForm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _inputController = TextEditingController(); // To access the content of the input and delete it
    return Scaffold(
      body: Center(
          child: const LoginForm(),
      ),
    );
  }
}