import 'package:flutter/material.dart';

class SliderNotifier extends ChangeNotifier {
  double stateManagerValue = 0.4;

  void changeStateManagerValue(double value) {
    stateManagerValue = value;
    notifyListeners();
  }
}
