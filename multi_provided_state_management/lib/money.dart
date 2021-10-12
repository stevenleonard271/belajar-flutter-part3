import 'package:flutter/foundation.dart';

class Money with ChangeNotifier {
  int _balance = 20000;
  get balance => _balance;

  set balance(value) {
    _balance = value;
    notifyListeners();
  }
}
