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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered X out of Y question correctly!'),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30,),
            TextButton(
                onPressed: (){},
                child: Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
