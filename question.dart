import 'package:flutter/material.dart';

//key in "stateless widget" to bring out the entire class
// ignore: must_be_immutable
class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //wrap text as container
      width: double.infinity, //container to get as big as it can get
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        //adding style to widget
        //CTRL+Space in () to bring out dropdown menu
        textAlign: TextAlign.center,
      ),
    );
  }
}
// 2 types of optioal parameters
// 1-named, wrapped in {}
// 2-positional, wrapped in []
