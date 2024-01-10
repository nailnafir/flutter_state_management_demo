import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;
  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  Color get themeColor =>
      _isDark ? Colors.purple.withOpacity(0.18) : Colors.white;
  Color get textColor => _isDark ? Colors.white : Colors.black;
}
