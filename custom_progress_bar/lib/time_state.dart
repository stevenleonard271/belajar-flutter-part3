import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeState with ChangeNotifier {
  int _time = 15;

  int get time => _time;

  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }
}
