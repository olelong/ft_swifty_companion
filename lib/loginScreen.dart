import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io'; // just for error of internet connection


import 'userToken.dart';
import 'appConfig.dart';
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
    getAccessToken(context);
  }

  Future<void> getAccessToken(BuildContext context) async { // BuildContext just to show to the user's screen, if an error occurred in the request
    final url = Uri.parse(AppConfig.apiUrl + "/oauth/token");
    try {
      final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: convert.json.encode({
            'client_id': AppConfig.clientId,
            'client_secret': AppConfig.clientSecret,
            'grant_type': 'client_credentials',
          })
      );
      if (response.statusCode == 200) {
        final data = convert.json.decode(response.body);
        if (data != null && data['access_token'] != null) {
          UserToken userToken = UserToken.fromJson(data);
          print("Success to get token access");
        } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Invalid response: missing token"),
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
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("API error: ${response.statusCode}"),
            duration: Duration(seconds: 6),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),),
        );
      }
    }
    catch (e){
      String errorMsg = e is SocketException
          ? "No internet connection"
          : "Network error: $e";

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
    }
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