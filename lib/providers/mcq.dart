import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/mcq.dart';
import '../pages/home.dart';

class McqProvider with ChangeNotifier {
  Mcq? _mcq;
  int _currentQuestionIndex = 0;
  int _counter = 10; // Timer counter
  bool _counterFinished = false;
  int? _userChoice;
  bool? _isCorrect;
  bool _showCorrectAnswer = false;
  double _favScal = 1.0;
  Color _favColor = Colors.white;
  List<Icon> _scoreKeeper = []; // List to track user's score
  bool _isLoading = true; // Track loading state
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player for sounds
  Timer? _timer; // Timer for the countdown

  Mcq? get mcq => _mcq;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get counter => _counter;
  bool get counterFinished => _counterFinished;
  int? get userChoice => _userChoice;
  bool? get isCorrect => _isCorrect;
  bool get showCorrectAnswer => _showCorrectAnswer;
  double get favScal => _favScal;
  Color get favColor => _favColor;
  List<Icon> get scoreKeeper => _scoreKeeper;
  bool get isLoading => _isLoading;

  Future<void> fetchMcqData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http
          .get(
            Uri.parse('https://api.jsonserve.com/Uw5CrX'), // Your API endpoint
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        // Parse the JSON response into your Mcq model
        _mcq = Mcq.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Failed to fetch data');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Play sound for timer tick
  void playClockTick() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/clock_tic.wav'));
      if (kDebugMode) {
        print('Clock tick sound played');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error playing clock tick sound: $e');
      }
    }
  }

  // Play sound for correct answer
  void playCorrectSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/correct-6033.wav'));
      if (kDebugMode) {
        print('Correct sound played');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error playing correct sound: $e');
      }
    }
  }

  // Play sound for wrong answer
  void playWrongSound() async {
    try {
      await _audioPlayer
          .play(AssetSource('sounds/buzzer-or-wrong-answer-20582.wav'));
      if (kDebugMode) {
        print('Wrong sound played');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error playing wrong sound: $e');
      }
    }
  }

  // Start the timer
  void startTimer() {
    stopTimer();
    // Cancel any existing timer before starting a new one

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      _counter--;
      if (counter == 5) {
        playClockTick();
      }
      if (counter == 0 && userChoice == null) {
        _counterFinished = true;

        _audioPlayer.stop();
        timer.cancel();
        scoreKeeper.add(const Icon(
          Icons.question_mark,
          color: Colors.white,
        ));
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  // Check the user's answer
  void checkAnswer(int index, BuildContext context) {
    _userChoice = index;
    _isCorrect =
        _mcq!.questions[_currentQuestionIndex].options[index].isCorrect;

    // Play sound based on correctness
    if (_isCorrect!) {
      playCorrectSound();
      _favColor = Colors.red; // Change favColor to red for correct answer
    } else {
      playWrongSound();
      _favColor = Colors.white; // Keep favColor white for wrong answer
    }

    // Update scoreKeeper
    if (_isCorrect!) {
      _scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
    } else {
      _scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
    }

    // Show feedback alert
    showAnswerFeedback(context);

    // Stop the timer
    stopTimer();

    notifyListeners();
  }

  // Move to the next question
  void nextQuestion(BuildContext context) {
    if (_currentQuestionIndex < _mcq!.questions.length - 1) {
      _currentQuestionIndex++;
      _userChoice = null;
      _isCorrect = null;
      _showCorrectAnswer = false;
      _counter = 10; // Reset the counter
      _favColor = Colors.white; // Reset favColor to white
      startTimer(); // Start the timer for the next question
      notifyListeners();
    } else {
      // Show quiz result alert
      showQuizResult(context);
      _counterFinished = true;
      notifyListeners();
    }
  }

  // Show the correct answer
  void showAnswer(BuildContext context) {
    _showCorrectAnswer = true;
    showTheCorrectAnswer(context); // Show correct answer alert
    notifyListeners();
  }

  // Reset the quiz
  void resetQuiz() {
    _currentQuestionIndex = 0;
    _userChoice = null;
    _isCorrect = null;
    _showCorrectAnswer = false;
    _scoreKeeper.clear();
    _counterFinished = false;
    _counter = 10; // Reset the counter
    _favColor = Colors.white; // Reset favColor to white
    stopTimer(); // Stop the timer
    notifyListeners();
  }

  // Show feedback for the answer
  void showAnswerFeedback(BuildContext context) {
    if (_isCorrect == true) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Correct!',
        text: 'You got it right!',
      );
    } else if (_isCorrect == false) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Incorrect!',
        text: 'Oops! That\'s not the right answer.',
      );
    }
  }

  // Show quiz result
  void showQuizResult(BuildContext context) {
    final correctAnswers =
        _scoreKeeper.where((icon) => icon.icon == Icons.check).length;
    final totalQuestions = _mcq!.questions.length;

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

  // Show the correct answer
  void showTheCorrectAnswer(BuildContext context) {
    final correctAnswer = _mcq!.questions[_currentQuestionIndex].options
        .firstWhere((option) => option.isCorrect);

    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Correct Answer',
      text: 'The correct answer is: ${correctAnswer.description}',
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer
    _audioPlayer.dispose(); // Dispose the audio player
    super.dispose();
  }
}
