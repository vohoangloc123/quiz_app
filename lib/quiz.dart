
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static const startAlignment = Alignment.topLeft;
  static const endAlignment = Alignment.bottomRight;
  Widget? activeScreen; //Biến này có kiểu Widget?, có thể là bất kỳ widget nào hoặc null.
  @override
  void initState() {
    activeScreen=StartScreen(startQuiz: switchScreen);
     super.initState();
   }
  void switchScreen() {
    setState(() {
      activeScreen= const QuestionsScreen();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
                Color.fromARGB(255, 33, 58, 87),
                Color.fromARGB(255, 11, 100, 119),
                Color.fromARGB(255, 20, 145, 155),
                Color.fromARGB(255, 10, 209, 200),
                Color.fromARGB(255, 69, 223, 177),
                Color.fromARGB(255, 128, 237, 153),
            ],begin: startAlignment, end: endAlignment)
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
