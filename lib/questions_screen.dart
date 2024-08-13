import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  } /*
  Cập nhật giao diện: Thay đổi trạng thái (như chỉ số câu hỏi) và làm mới giao diện người dùng.
  Tối ưu hóa: Cập nhật chỉ những phần cần thiết của giao diện thay vì làm mới toàn bộ ứng dụng.
  Quản lý trạng thái: Đảm bảo giao diện phản ánh đúng trạng thái hiện tại của widget.
  */

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color:  const Color.fromARGB(255, 127, 219, 243),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: AnswerButton(
                        answerText: answer, onTap: (){
                          answerQuestion(answer);
                    }));
              }),
            ]),
      ),
    );
  }
}
