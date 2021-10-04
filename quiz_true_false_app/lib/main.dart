import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'question_bank.dart';

QuestionBank questionBank = QuestionBank();

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
  List<Expanded> iconsList = [];
  int score = 0;

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
                questionBank.getQuestionText(), //setting the question here.
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            )),
          ),
          Expanded(
            child: Container(
              child: TextButton(
                onPressed: () {
                  checkAnswer(true); //this is the ans what the user chose.
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
                checkAnswer(false);
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

  void checkAnswer(bool clickedAns) {
    setState(() {
      if (!questionBank.isLastQuestion()) {
        // iconsList.add((clickedAns == questionBank.getQuestionAns())
        //     ? Icon(Icons.check, color: Colors.green)
        //     : Icon(Icons.close, color: Colors.red));
        if (clickedAns == questionBank.getQuestionAns()) {
          iconsList
              .add(Expanded(child: Icon(Icons.check, color: Colors.green)));
          score += 1;
        } else {
          iconsList.add(Expanded(child: Icon(Icons.close, color: Colors.red)));
        }
      }

      questionBank
          .moveToNextQuestion(); //updates the question counter and this being inside setState() will redraw the
      //UI elements this update affects.
      if (questionBank.isLastQuestion()) {
        // print("Last question reached!");
        showQuizOverDialog();
      }
    });
  }

  void showQuizOverDialog() {
    //show dialog with score and restart option after quiz is finished.
    Alert(
      context: context,
      type: AlertType.success,
      title: "Hey you have reached the end!",
      desc: "Score : $score/${questionBank.getNumberOfQuestions()}",
      buttons: [
        DialogButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            reset();
            Navigator.pop(context);
          },
          color: Colors.green,
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        ),
      ],
    ).show();
  }

  void reset() {
    //reset all the values related to the quiz.
    setState(() {
      questionBank.reset();
      score = 0;
      iconsList = [];
    });
  }
}
