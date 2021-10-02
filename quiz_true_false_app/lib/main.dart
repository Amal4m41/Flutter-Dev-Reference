import 'package:flutter/material.dart';

void main() {
  runApp(const QuizPage());
}

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Quiz(),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> iconsList = [];
  int questionCounter = 0;
  List<List<String>> questions = [
    ["Question 1", 't'],
    ["Question 2", 'f'],
    ["Question 3", 't'],
    ["Question 4", 't'],
    ["Question 5", 'f']
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 5,
            child: Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Text(
                questions[questionCounter][0], //setting the question here.
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            )),
          ),
          Expanded(
            child: Container(
              child: TextButton(
                onPressed: () {
                  checkAnswer('t');
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    "True",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                checkAnswer('f');
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Row(
            children: iconsList,
          ),
        ]));
  }

  void checkAnswer(String clickedAns) {
    setState(() {
      iconsList.add((clickedAns == questions[questionCounter][1])
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red));

      if (questionCounter + 1 < 5) {
        questionCounter++;
      }
    });
  }
}
