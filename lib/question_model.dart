//this class contains model for questions, it means each question will contain question and true or false value to it
class Question {
  String questionText = '';
  List<String> ansArr = [];
  int questionAnswerIndex = -1;

  Question(this.questionText, this.ansArr, this.questionAnswerIndex);
}
