import 'package:flutter/material.dart';

class ButtonProvider with ChangeNotifier {
  bool _isEnabled = false;
  String _buttonText;

  ButtonProvider(this._buttonText);

  bool get isEnabled => _isEnabled;
  String get buttonText => _buttonText;

  void toggleButton(bool value) {
    _isEnabled = value;
    notifyListeners();
  }

  void updateText(String newText) {
    _buttonText = newText;
    notifyListeners();
  }
}
