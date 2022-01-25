import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionindex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionindex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionindex]['questiontext'] as String,
        ),
        ...(questions[questionindex]['answers'] as List<Map<String,dynamic>>).map((answer) {
          return Answer(()=>answerQuestion(answer['score']), answer['text']as String);
        }).toList()
      ],
    );
  }
}
