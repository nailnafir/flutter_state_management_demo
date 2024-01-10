import 'package:flutter/material.dart';

class MoneyProvider with ChangeNotifier {
  int _balance = 5000;
  int get balance => _balance;
  set balance(int value) {
    _balance = value;
    notifyListeners();
  }
}
