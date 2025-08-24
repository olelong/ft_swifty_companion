import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io'; // just for error of internet connection

import 'appConfig.dart';
import 'userToken.dart';
import 'userInfoScreen.dart';
import 'userInfos.dart';

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
  int statusCode = 0;
  UserInfos? userInfos;

  Future<bool> checkUser(String login, BuildContext context) async {
    String? token = await UserToken.getToken();

    // If token doesn't exist yet
    if (token == null) {
      await UserToken.getAccessToken(context);
      token = await UserToken.getToken();
      if (token == null) return false;
    }
    final _url = Uri.parse(
        AppConfig.apiUrl + "/v2/users/" + login + "?access_token=" + token);
    try {
      final response = await http.get(_url);

      // if the token expired (401 unauthorized request)
      if (response.statusCode == 401) {
        await UserToken.getAccessToken(context);
        token = await UserToken.getToken();
        if (token != null) {
          final retryUrl = Uri.parse(AppConfig.apiUrl + "/v2/users/$login?access_token=$token");
          final retryResponse = await http.get(retryUrl);
          if (retryResponse.statusCode == 200) {
            final data = json.decode(retryResponse.body);
            setState(() {
              userInfos = UserInfos.fromJson(data);
              statusCode = retryResponse.statusCode;
            });
            return true;
          }
          else {
            print("Error: ${response.statusCode}");
            print("User doesn't exist");
            return false;
          }
          return false;
        }
        return false;
      }

      // If response is 200
      setState(() {
        statusCode = response.statusCode;
      });
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        setState(() {
          userInfos = UserInfos.fromJson(data);
        });
        return true;
      }
      else {
        print("Error: ${response.statusCode}");
        print("User doesn't exist");
        return false;
      }
    } catch (e) {
        String errorMsg = e is SocketException
            ? "No internet connection"
            : "Error during the request: $e";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            duration: Duration(seconds: 6),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),),
        );
        return false;
    }
  }

  Future<void> _submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      String login = _loginController.text;

      final res = await checkUser(login, context);
      bool isValid = res == true;

      setState(() => _isLoading = false);
      if (isValid && userInfos != null){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text('$login')),
              body: userInfoScreen(userInfos: userInfos!),
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
          SnackBar(
            content: Text(errorMsg),
            duration: Duration(seconds: 6),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
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
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a login',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a login';
                } else if (value == '/' || value == '\\') {
                  return 'Login invalid (/ or \\)';
                }
                return null;
              },
              onFieldSubmitted: (_) => _submit(context),
            ),
          ),
          FilledButton(
            onPressed: _isLoading ? null : () => _submit(context),
            child: _isLoading
                ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                : Text('Submit'),
          ),
        ],
      ),
    );
  }
}