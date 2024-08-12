import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Question screen'),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(onPressed: () {}, child: Text('Answer 1'))
      ]),
    );
  }
}
