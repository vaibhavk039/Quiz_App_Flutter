import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final VoidCallback reset;

  Result(this.resultscore, this.reset);

  String get resultphrase {
    var resulttext = 'You did it!';
    if (resultscore <= 8) {
      resulttext = 'You are awesome and innocent!';
    } else if (resultscore <= 12) {
      resulttext = 'Pretty likeable';
    } else if (resultscore <= 16) {
      resulttext = "You are .... strange?";
    } else {
      resulttext = "You are so bad!";
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultphrase,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              child: Text("Restart quiz"),
              textColor: Colors.blue,
              onPressed: reset)
        ],
      ),
    );
  }
}
