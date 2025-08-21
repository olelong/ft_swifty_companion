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
      body: SingleChildScrollView(
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  children: [
                    Card(
                        elevation: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
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
                            height: 300,
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF68548E),
                                  ),),
                                Text('${userInfos.email}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF68548E),
                                  ),),
                                Text('${userInfos.wallet} ₳',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF68548E),
                                  ),),
                                Text('Level ${userInfos.level}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF68548E),
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),
                          ),
                        )
                    ),
                    Column(
                        children: [
                          Text(
                            'SKILLS',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF68548E),
                            ),),
                          Wrap(
                            spacing: 5,
                            runSpacing: 15,
                            children: List.generate(userInfos.skills.length, (i) {
                              final skill = userInfos.skills[i];
                              final  percentage = 100 * skill['level'] / 20; // between 0 and 100
                              return  Container (
                                width: MediaQuery.of(context).size.width * 0.82,
                                child: Column(
                                    children: [
                                      Row(
                                          children: [
                                            Text(
                                              '${skill['name']}: ${skill['level']} ',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF68548E),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('(${percentage.toStringAsFixed(1)}%)', // Just one number after the comma
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF68548E),
                                              ),
                                            ),
                                          ]
                                      ),
                                      LinearProgressIndicator(
                                        value: skill['level'] / 20.0, // between 0.0 and 1.0
                                        semanticsLabel: 'Linear progress indicator',
                                      ),
                                    ]

                                ),
                              );
                            }),
                          ),
                        ]
                    )
                  ],
                ),
              )
          )
      )
    );
  }
}