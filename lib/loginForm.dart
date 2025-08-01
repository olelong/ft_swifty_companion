import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io'; // just for error of internet connection

import 'appConfig.dart';
import 'userToken.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  // a global key that uniquely identifies the Form widget and allows validation of the form
  final _loginController = TextEditingController();
  bool _isLoading = false;
  String? user;
  int statusCode = 0;

  Future<bool> checkUser(String login) async {
    final token = await UserToken.getToken();
    if (token == null) return false;
    final _url = Uri.parse(
        AppConfig.apiUrl + "/v2/users/" + login + "?access_token=" + token);

    try {
      final response = await http.get(_url);
      setState(() {
        statusCode = response.statusCode;
      });
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        setState(() {
          user = data['login'];
        });
        print(data);
        return true;
      }
      else {
        print("Error: ${response.statusCode}");
        print("User doesn't exist");
        return false;
      }
    } catch (e) {
      if (e is SocketException) {
        print("No internet connection");
      } else
          print('Error during the request: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 100.0,
              vertical: 20.0,
            ),
            child: TextFormField(
              controller: _loginController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a login',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a login';
                }
                return null;
              },
            ),
          ),
          FilledButton(
            onPressed: _isLoading ? null : () async {
              if (_formKey.currentState!.validate()) {
                setState(() => _isLoading = true);
                String login = _loginController.text;

                final res = await checkUser(login);
                bool isValid = res == true;

                setState(() => _isLoading = false);
                if (isValid){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(title: Text('$login')),
                        body: Center(child: Text('Welcome!')),
                      )
                  ));
                } else {
                  late final errorMsg;
                  if (statusCode == "401" || statusCode == "403")
                    errorMsg = "($statusCode) Invalid or missing token.";
                  else if (statusCode >= 500 && statusCode< 600 )
                    errorMsg = "($statusCode) Server error";
                  else if (statusCode >= 500 && statusCode< 600 )
                    errorMsg = "($statusCode) Server error";
                  else
                    errorMsg = "User does not exist";
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorMsg)),
                  );
                }
              }
            },
            child: _isLoading
                ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                : Text('Submit'),
          ),
        ],
      ),
    );
  }
}