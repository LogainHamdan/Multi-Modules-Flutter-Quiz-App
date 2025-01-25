import 'package:flutter/cupertino.dart';

class FieldProvider with ChangeNotifier {
  bool _isEnabled = false;
  String _buttonText;

  // Controllers for Login fields
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passLoginController = TextEditingController();

  // Controllers for Register fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailRegController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passRegController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();

  // Error messages for Login fields
  String? _emailLoginError;
  String? _passLoginError;

  // Error messages for Register fields
  String? _firstNameError;
  String? _surnameError;
  String? _userNameError;
  String? _emailRegError;
  String? _numberError;
  String? _passRegError;
  String? _confPassError;

  FieldProvider(this._buttonText);

  bool get isEnabled => _isEnabled;
  String get buttonText => _buttonText;

  // Getters for Login error messages
  String? get emailLoginError => _emailLoginError;
  String? get passLoginError => _passLoginError;

  // Getters for Register error messages
  String? get firstNameError => _firstNameError;
  String? get surnameError => _surnameError;
  String? get userNameError => _userNameError;
  String? get emailRegError => _emailRegError;
  String? get numberError => _numberError;
  String? get passRegError => _passRegError;
  String? get confPassError => _confPassError;

  void toggleButton(bool value) {
    _isEnabled = value;
    notifyListeners();
  }

  void updateText(String newText) {
    _buttonText = newText;
    notifyListeners();
  }

  // Email validation regex
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Validate Login fields
  bool validateLoginForm() {
    bool isValid = true;

    // Reset error messages
    _emailLoginError = null;
    _passLoginError = null;

    // Validate email
    if (emailLoginController.text.isEmpty) {
      _emailLoginError = 'Email is required';
      isValid = false;
    } else if (!isValidEmail(emailLoginController.text)) {
      _emailLoginError = 'Enter a valid email address';
      isValid = false;
    }

    // Validate password
    if (passLoginController.text.isEmpty) {
      _passLoginError = 'Password is required';
      isValid = false;
    }

    toggleButton(isValid); // Enable/Disable button based on validation
    notifyListeners();
    return isValid;
  }

  // Validate Register fields
  bool validateRegisterForm() {
    bool isValid = true;

    // Reset error messages
    _firstNameError = null;
    _surnameError = null;
    _userNameError = null;
    _emailRegError = null;
    _numberError = null;
    _passRegError = null;
    _confPassError = null;

    // Validate first name
    if (firstNameController.text.isEmpty) {
      _firstNameError = 'First name is required';
      isValid = false;
    }

    // Validate surname
    if (surnameController.text.isEmpty) {
      _surnameError = 'Surname is required';
      isValid = false;
    }

    // Validate username
    if (userNameController.text.isEmpty) {
      _userNameError = 'Username is required';
      isValid = false;
    }

    // Validate email
    if (emailRegController.text.isEmpty) {
      _emailRegError = 'Email is required';
      isValid = false;
    } else if (!isValidEmail(emailRegController.text)) {
      _emailRegError = 'Enter a valid email address';
      isValid = false;
    }

    // Validate phone number
    if (numberController.text.isEmpty) {
      _numberError = 'Phone number is required';
      isValid = false;
    }

    // Validate password
    if (passRegController.text.isEmpty) {
      _passRegError = 'Password is required';
      isValid = false;
    }

    // Validate confirm password
    if (confPassController.text.isEmpty) {
      _confPassError = 'Confirm password is required';
      isValid = false;
    } else if (passRegController.text != confPassController.text) {
      _confPassError = 'Passwords do not match';
      isValid = false;
    }

    toggleButton(isValid); // Enable/Disable button based on validation
    notifyListeners();
    return isValid;
  }

  // Method to clear all fields
  void clearFields() {
    // Clear Login fields
    emailLoginController.clear();
    passLoginController.clear();

    // Clear Register fields
    firstNameController.clear();
    surnameController.clear();
    userNameController.clear();
    emailRegController.clear();
    numberController.clear();
    passRegController.clear();
    confPassController.clear();

    // Reset error messages
    _emailLoginError = null;
    _passLoginError = null;
    _firstNameError = null;
    _surnameError = null;
    _userNameError = null;
    _emailRegError = null;
    _numberError = null;
    _passRegError = null;
    _confPassError = null;

    toggleButton(false); // Disable the button after clearing
    notifyListeners();
  }
}
