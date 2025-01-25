import 'package:flutter/material.dart';
import '../widgets/validation.dart';

class TextFieldProvider with ChangeNotifier {
  String _text = '';
  String? _error;

  String get text => _text;
  String? get error => _error;

  void updateText(String value) {
    _text = value;
    _error = null; // Reset the error when the text is updated
    notifyListeners();
  }

  void validateText(String value, String? Function(String?) validator) {
    _error = validator(value);
    notifyListeners();
  }

  // Validate email format
  bool validateEmail(String email) {
    if (email.isEmpty) {
      _error = 'Email is required';
      notifyListeners();
      return false;
    } else if (!ValidationUtils.isValidEmail(email)) {
      _error = 'Enter a valid email address';
      notifyListeners();
      return false;
    }
    _error = null;
    notifyListeners();
    return true;
  }

  bool get isValid => _error == null && _text.isNotEmpty;
}
