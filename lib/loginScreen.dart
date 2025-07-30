import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'userToken.dart';
import 'appConfig.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    getAccessToken();
  }

  // Future<void> getAccessToken() async {
  //   final url = Uri.parse(apiUrl + "/oauth/token");
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final List<dynamic>data = convert.json.decode(response.body);
  //     setState(() {
  //       // data.map((data) => UserInformation.fromJson(data)).toList();
  //       final List<UserInformation> user = data.map((e) => UserInformation.fromJson(e)).toList();
  //
  //     });
  //     print(data);
  //   }
  //   else
  //     print("Failed to get access");
  // }

  Future<void> getAccessToken() async {
    final url = Uri.parse(AppConfig.apiUrl + "/oauth/token");
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
      print("Response Body: ${response.body}");
      UserToken userToken = UserToken.fromJson(convert.json.decode(response.body));
    }
    else {
      print("Error: ${response.statusCode}");
      print("Error Body: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    String apiUrl = dotenv.get('URL');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Insert a login'),
            Text(AppConfig.apiUrl),
          ],
        ),
      ),
    );
  }
}