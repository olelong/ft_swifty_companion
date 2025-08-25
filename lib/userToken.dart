import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io'; // just for error of internet connection

import 'appConfig.dart';

class UserToken {
  final String accessToken;
  static const _storage = FlutterSecureStorage();

  UserToken({required this.accessToken});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    final userToken = UserToken(accessToken: json['access_token']);
    _storage.write(key: 'ACCESS_TOKEN', value: userToken.accessToken);
    return userToken;
  }

  static Future<void> getAccessToken(BuildContext context) async { // BuildContext just to show to the user's screen, if an error occurred in the request
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
          UserToken.fromJson(data);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Invalid response: missing token"),
              duration: Duration(seconds: 6),
            ),
          );
        }
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An API error occurred: ${response.statusCode}"),
            duration: Duration(seconds: 6),
          ),
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
        ),
      );
    }
  }

  // To read or delete the token
  static Future<String?> getToken() async => await _storage.read(key: 'ACCESS_TOKEN');
  static Future<void> deleteToken() async => await _storage.delete(key: 'ACCESS_TOKEN');
}