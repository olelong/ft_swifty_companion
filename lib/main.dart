import 'package:flutter/material.dart';
import 'loginScreen.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ft Swifty Companion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.deepPurple[100],
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Ft Swifty Companion")),
        body: const LoginScreen(),
      ),
    );
  }
}
