import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color:const Color.fromARGB(255, 255, 255, 255), //với 100 để làm độ mờ thay vì dùng Opacity để tránh giảm hiệu suất
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                  color: Colors.transparent), // Make border transparent
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),),
            ),
          )
        ],
      ),
    );
  }
}
