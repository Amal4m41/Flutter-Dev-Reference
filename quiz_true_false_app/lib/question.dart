//Data class for question and their ans.
class Question {
  String question = '';
  bool ans = false;

  Question({required String question, required bool answer}) {
    this.question = question.toString();
    ans = answer;
  }
}
