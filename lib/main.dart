import 'package:flutter/material.dart';
import 'package:quizzler_flutter/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text("QUIZ APP"),
          backgroundColor: Colors.black,
        ),
        body: const SafeArea(
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
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int correctScore = 0;
  int totalQuestions = quizBrain.getNumberOfQuestions();

  void checkAnswer(int userAnswer) {
    if (userAnswer == quizBrain.getAnswer()) {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      correctScore++;
    } else {
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    if (quizBrain.isFinished() == true) {
      Alert(
          context: context,
          title: "Quiz Completed!",
          content: Column(
            children: [
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
              Text('You got $correctScore correct out of $totalQuestions !')
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  scoreKeeper.clear();
                  quizBrain.reset();
                  correctScore = 0;
                });
              },
              child: const Text(
                "RETRY",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(0),
                ),
              ),
              child: Container(
                height: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text(
                    quizBrain.getChoices(0),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(0);
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0),
                ),
              ),
              child: Container(
                height: double.infinity,
                color: Colors.red,
                child: Center(
                  child: Text(
                    quizBrain.getChoices(1),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  setState(() {
                    checkAnswer(1);
                    quizBrain.nextQuestion();
                  });
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0),
                ),
              ),
              child: Container(
                height: double.infinity,
                color: Colors.red,
                child: Center(
                  child: Text(
                    quizBrain.getChoices(2),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  setState(() {
                    checkAnswer(2);
                    quizBrain.nextQuestion();
                  });
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0),
                ),
              ),
              child: Container(
                height: double.infinity,
                color: Colors.red,
                child: Center(
                  child: Text(
                    quizBrain.getChoices(3),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  setState(() {
                    checkAnswer(3);
                    quizBrain.nextQuestion();
                  });
                });
              },
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}
