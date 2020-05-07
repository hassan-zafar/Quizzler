import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain=QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scorekeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer=quizBrain.getQuestionAnswer();
                if(correctAnswer==true)
                  {
                    scorekeeper.add(Icon(Icons.check,color: Colors.green,),);
                  }
                else
                {
                  scorekeeper.add(Icon(Icons.close,color: Colors.red,),);
                }
                if(quizBrain.questionNumber>=12)
                  {
                    Alert(
                        context: context,
                        title: "QUIZ COMPLETED!!",
                        desc: "Nice Job.")
                        .show();
                  }
                setState(() {
                  quizBrain.nextQuestion();

                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {

                bool correctAnswer=quizBrain.getQuestionAnswer();
                if(correctAnswer==false)
                {
                  scorekeeper.add(Icon(Icons.check,color: Colors.green,),);
                }
                else
                  {
                    scorekeeper.add(Icon(Icons.close,color: Colors.red,),);
                  }
                if(quizBrain.questionNumber>=12)
                {
                  Alert(
                      context: context,
                      title: "QUIZ COMPLETED!!",
                      desc: "Nice Job.")
                      .show();
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
