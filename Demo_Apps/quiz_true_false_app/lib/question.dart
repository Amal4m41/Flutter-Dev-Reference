//Data class for question and their ans.
class Question {
  String question = '';
  bool ans = false;

  // Question({required String question, required bool answer}) {
  //   this.question = question.toString();
  //   ans = answer;
  // }
//OR
//   Question(String question, bool ans){
//     this.question = question;
//     this.ans = ans;
//   }
//OR
//   Question(this.question,this.ans);     //not named parameter
//OR
  Question({required this.question, required this.ans});
}
