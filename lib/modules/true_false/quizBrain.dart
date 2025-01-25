import 'package:Quiz/modules/true_false/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<QuestionTF> _questionBank = [
    QuestionTF(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    QuestionTF(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    QuestionTF(
      'A slug\'s blood is green.',
      true,
    ),
  ];
  int getQuestiosNumber() {
    return _questionBank.length;
  }

  int getCurrentQNumber() {
    return _questionNumber + 1;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
