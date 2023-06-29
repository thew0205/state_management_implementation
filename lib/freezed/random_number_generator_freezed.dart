import 'package:freezed_annotation/freezed_annotation.dart';

part 'random_number_generator_freezed.freezed.dart';

@freezed
class RandomNumberGeneratorFreezed with _$RandomNumberGeneratorFreezed {
  const factory RandomNumberGeneratorFreezed({
    required int minValue,
    required int maxValue,
    required int? randomNumber,
  }) = _RandomNumberGeneratorFreezed;
}
