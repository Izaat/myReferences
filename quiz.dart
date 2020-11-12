import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    //return Container();
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        //...(questions[questionIndex]['answers'] as List<String>).map((answer) {
        //String changed to Map after assigning scores
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          //return Answer(answerQuestion,
          return Answer(() => answerQuestion(answer['score']),
              answer['text']); //['text] being added ince its a string
        }).toList()
      ],
    );
  }
}
