import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  bool _isForgotton = false;

  bool get isForgotton => _isForgotton;

  void toggleForgotton() {
    _isForgotton = !_isForgotton;
    notifyListeners();
  }
}
