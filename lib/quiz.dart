import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static const startAlignment = Alignment.topLeft;
  static const endAlignment = Alignment.bottomRight;
  List<String> selectedAnswers=[];
  var activeScreen =
      'start-screen'; //Biến này có kiểu Widget?, có thể là bất kỳ widget nào hoặc null.
  void switchScreen() {
    setState(() {

      activeScreen = 'questions-screen';
    });
  }


  void chooseAnswer(String answer) {
    selectedAnswers.add(answer); // Thêm câu trả lời vào danh sách câu trả lời đã chọn
    if (selectedAnswers.length == questions.length) { // Kiểm tra nếu đã chọn câu trả lời cho tất cả các câu hỏi
      setState(() {
        activeScreen = 'result-screen'; // Cập nhật trạng thái để chuyển sang màn hình bắt đầu hoặc kết thúc
      });
    }
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
          ], begin: endAlignment, end: startAlignment)),
          child: activeScreen == 'start-screen'
              ? StartScreen(startQuiz: switchScreen)
              : activeScreen == 'questions-screen' ?QuestionsScreen(onSelectAnswer: chooseAnswer,)
                : ResultsScreen(chosenAnswers: selectedAnswers,),
        ),
      ),
    );
  }
}

