//this class contains all necessary code for question and different state of questions

import 'question_model.dart';

class QuizBrain {
  int _questionNum = 0;
  final List<Question> _questionBank = [
    Question('Mount Everest is the highest mountain in the World.',
        ["answer 1", "answer 2", "answer 3", "answer 4"], 0),
    Question('There are 9 planets in our Solar System.',
        ["ANSWER 1", "ANSWER 2", "answer 3", "answer 4"], 0),
    Question('Earth is the third planet in the Solar System.',
        ["answer 1", "answer 2", "answer 3", "answer 4"], 0),
    Question('Neil Armstrong in the first person to land on Moon.',
        ["answer 1", "answer 2", "answer 3", "answer 4"], 0),
    Question('There are 84600 seconds in one day.',
        ["answer 1", "answer 2", "answer 3", "answer 4"], 0),
    Question('Population of Nepal is 100 times more than population of Bhutan.',
        ["answer 1", "answer 2", "answer 3", "answer 4"], 0),
    Question(
        'Barack Obama became the president of United States for two consecutive terms.',
        ["answer 1", "answer 2", "answer 3", "answer 4"],
        0),
    Question('China is the biggest economy in the World.',
        ["answer 1", "answer 2", "answer 3", "answer 4"], 0)
  ];

  void reset() {
    _questionNum = 0;
  }

  void nextQuestion() {
    if (isFinished() == true) {
    } else {
      if (_questionNum < _questionBank.length - 1) {
        _questionNum++;
      }
    }
  }

  bool isFinished() {
    if (_questionBank[_questionNum] == _questionBank.last) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNum].questionText;
  }

  String getChoices(index) {
    return _questionBank[_questionNum].ansArr[index];
  }

  int getAnswer() {
    return _questionBank[_questionNum].questionAnswerIndex;
  }

  int getNumberOfQuestions() {
    return _questionBank.length;
  }
}
