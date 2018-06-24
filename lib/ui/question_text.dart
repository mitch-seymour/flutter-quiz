import "package:flutter/material.dart";

class QuestionText extends StatefulWidget {

  final String _questionText;
  final int _questionNumber;

  QuestionText(this._questionText, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> {
  @override
  Widget build(BuildContext context) {
    return new Material(color: Colors.white, child: new Center(
      child: new Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(widget._questionNumber.toString() + ": " + widget._questionText),
        ),
      )
    ));
  }
}