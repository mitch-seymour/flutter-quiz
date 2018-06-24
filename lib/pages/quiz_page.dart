import "package:flutter/material.dart";

import "../pages/score_page.dart";

import "../utils/question.dart";
import "../utils/quiz.dart";

import "../ui/answer_button.dart";
import "../ui/question_text.dart";
import "../ui/correct_wrong_overlay.dart";

class QuizPage extends StatefulWidget {

  @override
  State createState() {
    return new QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {

  Question currenQuestion;
  Quiz quiz = new Quiz([
    new Question("Penguins can fly", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  void handleAnswer(bool answer) {
    isCorrect = (currenQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    currenQuestion = quiz.nextQuestion;
    questionText = currenQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // this is our main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)
              ),
              (Route route) => route == null);
              return;
            }
            currenQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currenQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }) : new Container()
      ],
    );
  }
}