import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionindex = 0;
  final questions = const [
    {
      'questiontext': 'What\'s your favorite color',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 5},
        {'text': 'red', 'score': 2},
        {'text': 'yellow', 'score': 1},
      ],
    },
    {
      'questiontext': 'What\'s your favorite animal',
      'answers': [
        {'text': 'panda', 'score': 10},
        {'text': 'tiger', 'score': 5},
        {'text': 'lion', 'score': 2},
        {'text': 'bear', 'score': 1},
      ],
    },
    {
      'questiontext': 'What\'s your favorite ice-cream',
      'answers': [
        {'text': 'guava', 'score': 10},
        {'text': 'orange', 'score': 5},
        {'text': 'mango', 'score': 2},
        {'text': 'litchi', 'score': 1},
      ],
    },
  ];
  var totalscore = 0;

  void reset() {
    setState(() {
      questionindex = 0;
      totalscore = 0;
    });
  }

  void answerQuestion(int score) {
    totalscore += score;
    setState(() {
      questionindex = questionindex + 1;
    });

    if (questionindex < questions.length) {
      print("More questions");
    } else {
      print("No more questiond");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My App"),
          ),
          body: questionindex < questions.length
              ? Quiz(
                  answerQuestion: answerQuestion,
                  questionindex: questionindex,
                  questions: questions)
              : Result(totalscore, reset)),
    );
  }
}
