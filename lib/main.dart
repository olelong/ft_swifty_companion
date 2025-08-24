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
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF68548E),
          ),
          titleMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF68548E),
          ),
          bodyMedium: const TextStyle(
            fontSize: 15,
            color: Color(0xFF68548E),
          ),
          bodyLarge: const TextStyle(
            fontSize: 15,
            color: Color(0xFF68548E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Ft Swifty Companion")),
        body: const LoginScreen(),
      ),
    );
  }
}
