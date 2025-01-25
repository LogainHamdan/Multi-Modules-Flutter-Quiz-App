import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../modules/true_false/quizBrain.dart';
import '../pages/home.dart';

class TrueFalseQuizProvider with ChangeNotifier {
  final QuizBrain quizBrain = QuizBrain();
  final AudioPlayer player = AudioPlayer();
  List<Icon> scoreKeeper = [];
  int score = 0;
  int counter = 10;
  bool? isCorrect;
  bool? userChoice;
  Timer? timer;
  Color favColor = Colors.white;
  double favScal = 1;
  bool counterFinished = false;
  bool showCorrectAnswer = false;
  bool isLoading = true;

  TrueFalseQuizProvider() {
    // Start the timer when the provider is initialized
    startTimer();
  }

  Future<void> fetchQuizData() async {
    isLoading = true;
    notifyListeners();
    //
    // try {
    //   // Simulate a network call or data fetch
    //   // await Future.delayed(const Duration(seconds: 4));
    //   isLoading = false;
    //   notifyListeners();
    // } catch (e) {
    //   isLoading = false;
    //   notifyListeners();
    //   throw Exception('Failed to fetch data');
    // }
  }

  void checkAnswer(bool choice) {
    if (counter <= 5) {
      player.stop();
    }
    bool correctAnswer = quizBrain.getQuestionAnswer();
    cancelTimer();
    if (correctAnswer == choice) {
      score++;
      isCorrect = true;
      favColor = Colors.redAccent;
      favScal = 2;
      Timer(const Duration(milliseconds: 300), () {
        favScal = 1;
        notifyListeners();
      });
      Timer(const Duration(milliseconds: 1000), () {
        favColor = Colors.white;
        notifyListeners();
      });
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.lightGreen,
          size: 24,
        ),
      );
      playCorrectSound();
    } else {
      isCorrect = false;
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.redAccent,
          size: 24,
        ),
      );
      playWrongSound();
    }
    notifyListeners();

    if (quizBrain.isFinished()) {
      cancelTimer(); // Cancel the timer when the quiz is finished
      Timer(const Duration(seconds: 1), () {
        notifyListeners();
      });
    }
  }

  void next(BuildContext context) {
    if (quizBrain.isFinished()) {
      cancelTimer(); // Cancel the timer when the quiz is finished

      Timer(const Duration(seconds: 1), () {
        alertFinished(context);
        resetQuiz();
      });
    } else {
      counterFinished = false;
      showCorrectAnswer = false;
      counter = 10;
      startTimer(); // Restart the timer for the next question
      isCorrect = null;
      userChoice = null;
      quizBrain.nextQuestion();
    }
    notifyListeners();
  }

  void startTimer() {
    // Cancel any existing timer before starting a new one
    cancelTimer();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      counter--;
      if (counter == 5) {
        await player.setAsset('assets/sounds/clock_tic.wav');
        player.play();
      }
      if (counter == 0 && userChoice == null) {
        counterFinished = true;
        player.stop();
        timer.cancel();
        scoreKeeper.add(const Icon(
          Icons.question_mark,
          color: Colors.white,
        ));
      }
      notifyListeners();
    });
  }

  void cancelTimer() {
    timer?.cancel();
    timer = null; // Clear the timer reference
  }

  void resetQuiz() {
    quizBrain.reset();
    scoreKeeper.clear();
    isCorrect = null;
    userChoice = null;
    counter = 10;
    counterFinished = false;
    showCorrectAnswer = false;
    score = 0;
    cancelTimer(); // Cancel the timer when the quiz is reset
    startTimer(); // Restart the timer when the quiz is reset
    notifyListeners();
  }

  void alertFinished(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: score < (quizBrain.getQuestiosNumber() / 2)
          ? QuickAlertType.error
          : QuickAlertType.success,
      text: 'Your Score is $score/${quizBrain.getQuestiosNumber()}',
      title: score < (quizBrain.getQuestiosNumber() / 2)
          ? 'Good Luck!😞'
          : 'Congratulations! 🎉',
      confirmBtnText: 'Play Again',
      onConfirmBtnTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      onCancelBtnTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      },
      showCancelBtn: true,
      cancelBtnText: 'Finish',
      confirmBtnColor: Colors.green,
    );
  }

  void playCorrectSound() async {
    await player.setAsset('assets/sounds/correct-6033.wav');
    player.play();
  }

  void playWrongSound() async {
    await player.setAsset('assets/sounds/buzzer-or-wrong-answer-20582.wav');
    player.play();
  }

  void showAnswerFeedback(BuildContext context) {
    if (isCorrect == true) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Correct!',
        text: 'You got it right!',
      );
    } else if (isCorrect == false) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Incorrect!',
        text: 'Oops! That\'s not the right answer.',
      );
    }
  }

  void showQuizResult(BuildContext context) {
    final correctAnswers =
        scoreKeeper.where((icon) => icon.icon == Icons.check).length;
    final totalQuestions = quizBrain.getQuestiosNumber();

    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Quiz Finished!',
      text: 'You got $correctAnswers out of $totalQuestions questions correct.',
      confirmBtnText: 'Restart',
      cancelBtnText: 'Exit',
      showCancelBtn: true, // Enable the cancel button
      onConfirmBtnTap: () {
        resetQuiz(); // Reset the quiz
        Navigator.pop(context); // Close the alert
      },
      onCancelBtnTap: () {
        resetQuiz(); // Reset the quiz
        Navigator.pushReplacementNamed(
            context, HomePage.id); // Navigate to HomePage
      },
    );
  }

  void showTheCorrectAnswer(BuildContext context) {
    final correctAnswer = quizBrain.getQuestionAnswer();

    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Correct Answer',
      text: 'The correct answer is: ${correctAnswer ? 'True' : 'False'}',
    );
  }

  @override
  void dispose() {
    cancelTimer(); // Cancel the timer when the provider is disposed
    player.stop();
    super.dispose();
  }
}
