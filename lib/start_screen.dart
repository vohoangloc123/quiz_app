import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: Color.fromARGB(150, 255, 255,
                  255), //với 100 để làm độ mờ thay vì dùng Opacity để tránh giảm hiệu suất
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Learn Flutter the fun way',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: startQuiz,
              icon: Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: Colors.transparent), // Make border transparent
              ),
              label: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
