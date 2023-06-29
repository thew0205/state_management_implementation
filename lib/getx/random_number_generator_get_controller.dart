import 'dart:math';

import 'package:get/get.dart';

class RandomNumberGeneratorGetController extends GetxController {
  static final randomGenerator = Random();

  final _minValue = 0.obs;
  int get minValue => _minValue.value;
  void setMinValue(int value) {
    _minValue(value);
  }

  final _maxValue = 10.obs;
  int get maxValue => _maxValue.value;
  void setMaxValue(int value) {
    _maxValue(value);
  }

  final _randomNumber = Rx<int?>(null);
  int? get randomNumber => _randomNumber.value;
  void generateRandomNumber() {
    _randomNumber(randomGenerator.nextInt(maxValue - minValue + 1) + minValue);
  }
}
