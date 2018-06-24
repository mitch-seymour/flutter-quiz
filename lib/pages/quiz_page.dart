import "package:flutter/material.dart";

import "../ui/answer_button.dart";
import "../ui/question_text.dart";

class QuizPage extends StatefulWidget {
  @override
  State createState() {
    return new QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column( // this is our main page
          children: <Widget>[
            new AnswerButton(true, () => print("you answered true")),
            new QuestionText("Penguins can fly?", 1),
            new AnswerButton(false, () => print("you answered false")),
          ],
        ),
      ],
    );
  }
}