import 'package:flutter/material.dart';
//import './question.dart'; //to link between main.dart and question.dart
//import './answer.dart'; //to link between main.dart to answer.dart
import './quiz.dart';
import './result.dart';

//void main() {
//runApp(MyApp());
//}

// UpperCamelCase or PascalCase = Classes
// lowerCamelCase = Methods and Variables

void main() => runApp(MyApp());
// => is a shortcut and only for single command for {}

//StatefulWidget examples; CheckBox,TextField, Forms and other user interactions
//Overrides createState() and returns State

//StatelessWidget examples; IconButtons, Icons, Logos
//Overrides build() and returns Widget

//Refactor: Key shortcut = Ctrl+Shift+R to convert Stateless to Stateful vice versa
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    //TODO: implement createState
    return _MyAppState();
  }
}

// In order to restrict class/method access by another file, add an underscore
// to the class name
//State is a generic class and it canot be overwritten ie Stateless
class _MyAppState extends State<MyApp> {
//Can remove <MyApp>. Only added to link the class to MyApp class

  static const _questions = [
    /*
    {
      'questionText': 'What\'s your favourite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
      //the shorter method in creating MAP
    },
    */

    {
      //Assigning scores to MAP
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 9},
        {'text': 'Green', 'score': 6},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Cats', 'score': 1},
        {'text': 'dogs', 'score': 2},
        {'text': 'rabbit', 'score': 4},
        {'text': 'mouse', 'score': 5},
      ],
    },
    {
      'questionText': 'What is your fovourite' 'bong',
      'answers': [
        {'text': 'vertical', 'score': 4},
        {'text': 'horizontal', 'score': 5},
        {'text': 'flat', 'score': 2},
        {'text': 'round', 'score': 3},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    //int score added to calculate score
    //linked to onPressed, void means return

    _totalScore += score;

    setState(() {
      //setState being added to link this to statefulWidget class
      //be mindful body children need to be updated as well
      _questionIndex = _questionIndex + 1;
    });

    //questionIndex = questionIndex + 1; //deleted since setState being added
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('still have more questions');
    } else {
      print('No more question');
    }
  }

  @override //redefinition of the Widget class member
  Widget build(BuildContext context) {
    //turn variables as a list after creating answer.dart

    /* //moved questions out of build-domain to class domain in MyAppState Class
      //what-if statement unable to read constant variables from another build or class
    const questions = [
      //Final vs const vs var
      //Final refers to runtime constant value, only locks val during runtime
      //Const refers to value that never changes, ie the list of questions
      //if "const" is infront of variable, the variable is constant
      //if "const" is infront of value, then the value is constant
      //all objects in dart keeps on rebuilding and rerunning overwriting the value in variables,
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
        //the shorter method in creating MAP
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': ['Cats', 'dogs', 'rabbit', 'mouse'],
      },
      {
        'questionText': 'What is your fovourite' 'bong',
        'answers': ['vertical', 'horizontal', 'flat', 'round'],
      },
    ];*/

    /*var questions = [
      'How\'s your day?', //stored as 0
      'How are you?', //stored as 1
    ];  //all list here tranferred to questionText above    */

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //Refers to the header
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ) //Ctrl+Space for IDE Support
            //Added "Quiz" after tranferring Column to quiz.dart, change all questions to _questions.

            /* Column( //Column transferred to quiz.dart
                //Column for up and down, Row for left and right
                // ? is to check if value is true
                // to add else statement after Column function
                children: [
                  /*Text('The question'),*/ //just a text line below AppBar
                  /*Text(
              questions.elementAt(0),
            ), //Calling the list of index from var
            */

                  Question(
                    //uses 'Question' from 'question.dart' instead of local 'Text'
                    //shortcut from using elementAt
                    //questions[0],
                    //therefore, to retrieve from setState
                    questions[_questionIndex]['questionText'],
                    //questionText refers to the questionText in question.dart after creating answer.dart
                  ),

                  //creating a list via .map method
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    // "..." will pull out a list from the list of answer widgets aka spread
                    //wrapping question[_questionIndex]['answer'] by
                    //brackets and adding "as List<String> will force art program to recognize the listed answer widgets

                    return Answer(_answerQuestion, answer);
                    //inserted _answerQuestion to call .map listed in answer.dart
                    //mapping a list to widget
                  }).toList()
                  //toList - to add list to another list

                  /* //to avoid hardcoding answer widget 3 times, we use .map as above
            Answer(_answerQuestion), 
            Answer(_answerQuestion), //This method is known as "callback"
            Answer(_answerQuestion),
            */

                  /*
            RaisedButton(
              child: Text('Answer3'),
              onPressed: () => print('Answer 3 Chosen'),
            ),
            OR
            RaisedButton(
              child: Text('Answer3'),
              onPressed: () {
                print('Answer 3 chosen');
              },
            ),
            */
                ],
              ) */ //Column being transferred to Quiz.dart
            : Result(_totalScore,
                _resetQuiz), //Result being added after transferring Center function
        /* Center( //Transferred to result.dart after creating quiz.dart
                child: Text('You did it!'),
              ),*/
      ),
    );
  }
}

//Always have 1 single widget per file.

//BOOLEAN
// = is to store value
// == is to compare values
// != Not equal
// && And gate
// || Or gate

// "else if" is an OR gate for a function/command
// "null" to reset value
// "abcd += abc;" is the shorter version of "abcd = abcd + abc;"
//CTRL+SHIFT+R Wrap to column etc
