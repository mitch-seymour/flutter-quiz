import "./question.dart";

class Quiz {
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Question> get questions => this._questions;
  int get length => this._questions.length;
  int get questionNumber => this._currentQuestionIndex + 1;
  int get score => this._score;

  Question get nextQuestion {
    this._currentQuestionIndex++;
    if (_currentQuestionIndex >= length) {
      return null;
    }
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) {
      _score++;
    }
  }
}
