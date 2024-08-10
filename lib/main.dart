import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: StartScreen( colors: [
          Color.fromARGB(255, 33, 58, 87),
          Color.fromARGB(255, 11, 100, 119),
          Color.fromARGB(255, 20, 145, 155),
          Color.fromARGB(255, 10, 209, 200),
          Color.fromARGB(255, 69, 223, 177),
          Color.fromARGB(255, 128, 237, 153),
        ],),
      ),
    );
  }
}
