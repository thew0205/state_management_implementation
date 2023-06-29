import 'dart:math';

import 'package:flutter/material.dart';


class RandomNumberGeneratorChangerNotifier extends ChangeNotifier {
  int _minValue = 0;
  int _maxValue = 0;
  int? _randomNumber;
  static final randomGenerator = Random();

  int get minValue => _minValue;
  set minValue(int value) {
    _minValue = value;
    notifyListeners();
  }

  int get maxValue => _maxValue;
  set maxValue(int value) {
    _maxValue = value;
    notifyListeners();
  }
  int? get randomNumber => _randomNumber;

  void generateRandomNumber() {
    _randomNumber = randomGenerator.nextInt(maxValue - minValue + 1) + minValue;
    notifyListeners();
  }
}
