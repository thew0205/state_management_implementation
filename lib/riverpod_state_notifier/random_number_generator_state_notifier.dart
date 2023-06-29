import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../freezed/random_number_generator_freezed.dart';

class RandomNumberGeneratorStateNotifier
    extends StateNotifier<RandomNumberGeneratorFreezed> {
  RandomNumberGeneratorStateNotifier(super.state);
  static final randomGenerator = Random();

  void setMinValue(int value) {
    state = state.copyWith(minValue: value);
  }

  void setMaxValue(int value) {
    state = state.copyWith(maxValue: value);
  }

  void setRandomValue() {
    state = state.copyWith(
        randomNumber:
            randomGenerator.nextInt(state.maxValue - state.minValue + 1) +
                state.minValue);
  }
}

final randomNumberGeneratorProvider = StateNotifierProvider.autoDispose<
    RandomNumberGeneratorStateNotifier, RandomNumberGeneratorFreezed>((ref) {
  return RandomNumberGeneratorStateNotifier(const RandomNumberGeneratorFreezed(
      minValue: 0, maxValue: 10, randomNumber: null));
});
