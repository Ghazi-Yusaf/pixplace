import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidEmail(String input) {
    if (input == 'test@mail.com') {
      _isValid = true;
    }
    else {
      _isValid = false;
    }
    notifyListeners();
  }
}