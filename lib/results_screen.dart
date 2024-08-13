import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary.dart';

import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData(){
      final List<Map<String, Object>> summary=[];
      for(var i=0; i<chosenAnswers.length; i++){
        summary.add({
          'question_index': i,
          'question': questions[i].text,
          'correct_answer':questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        });
      }
      return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length; //lấy tổng số câu hỏi
    final numCorrectQuestions=summaryData.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length; //lọc ra số câu hỏi đúng
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions question correctly!',
            style: const TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 30,),
            OutlinedButton.icon(
                icon: Icon(
                  Icons.refresh,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: (){},
                label: const Text('Restart Quiz!', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
