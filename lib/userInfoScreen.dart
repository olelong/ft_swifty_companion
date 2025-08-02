import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io'; // just for error of internet connection

import 'appConfig.dart';
import 'userToken.dart';

class userInfoScreen extends StatefulWidget {
  final String user;
  const userInfoScreen({super.key, required this.user});

  @override
  _userInfoScreenState createState() {
    return _userInfoScreenState();
  }
}

class _userInfoScreenState extends State<userInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome ${widget.user}"),
      ),
    );
  }
}