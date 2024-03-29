import 'package:quiz_true_false_app/question.dart';

//class to store the list of questions and their functional logic.
class QuestionBank {
  int _questionCounter = 0; //to keep track of the question shown to the user.
  bool _isLastQuestionFlag = false;

  List<Question> _questionsList = [
    Question(
        question: "The world’s largest continent is Antarctica.", ans: false),
    Question(
        question: "The first domesticated animal was the horse.", ans: false),
    Question(
        question:
            "Most of the world’s coffee in the world is produced in Brazil.",
        ans: true),
    Question(question: "The Bible has 74 books in total.", ans: false),
    Question(
        question:
            "The first person to portray James Bond in a film was Sean Connery.",
        ans: true),
    Question(
        question:
            "The title of the first 3D film to be released worldwide was Forbidden Lover.",
        ans: false),
    Question(
        question:
            "The word “yoga” is derived from a Sanskrit word meaning posture.",
        ans: false),
  ];

  String getQuestionText() {
    return _questionsList[_questionCounter].question;
  }

  bool getQuestionAns() {
    return _questionsList[_questionCounter].ans;
  }

  int getNumberOfQuestions() => _questionsList.length;

  bool isLastQuestion() => _isLastQuestionFlag;

  //increments the question counter after verifying it with the question list length.
  void moveToNextQuestion() {
    if (_questionCounter < getNumberOfQuestions() - 1) {
      //if it's not the last question.
      _questionCounter++;
    } else {
      _isLastQuestionFlag = true;
    }
  }

  void reset() {
    _questionCounter = 0;
    _isLastQuestionFlag = false;
  }
}
