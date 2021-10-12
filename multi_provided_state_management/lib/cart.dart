import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;

  set quantity(value) {
    _quantity = value;
    notifyListeners();
  }
}
