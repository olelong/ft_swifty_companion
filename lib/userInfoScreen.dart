import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io'; // just for error of internet connection

import 'appConfig.dart';
import 'userToken.dart';
import 'userInfos.dart';

class userInfoScreen extends StatelessWidget {
  final UserInfos userInfos;
  const userInfoScreen({super.key, required this.userInfos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFF68548E), //#68548E
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.deepPurple[100],
                child: Padding (
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 280,
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userInfos.picture),
                          radius: 80,
                        ),
                        Text(
                          '${userInfos.user}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF68548E),
                          ),),
                        Text(
                          '${userInfos.username}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF68548E),
                          ),),
                        Text('${userInfos.email}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF68548E),
                          ),),
                        Text('${userInfos.wallet} ₳',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF68548E),
                          ),),
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}