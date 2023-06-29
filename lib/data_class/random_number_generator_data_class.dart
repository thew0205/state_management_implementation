import 'dart:convert';

class RandomNumberGenerator {
  final int minValue;
  final int maxValue;
  final int? randomNumber;

  RandomNumberGenerator(
    this.minValue,
    this.maxValue,
    this.randomNumber,
  );

  RandomNumberGenerator copyWith({
    int? minValue,
    int? maxValue,
    int? randomNumber,
  }) {
    return RandomNumberGenerator(
      minValue ?? this.minValue,
      maxValue ?? this.maxValue,
      randomNumber ?? this.randomNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'minValue': minValue,
      'maxValue': maxValue,
      'randomNumber': randomNumber,
    };
  }

  factory RandomNumberGenerator.fromMap(Map<String, dynamic> map) {
    return RandomNumberGenerator(
      map['minValue'] as int,
      map['maxValue'] as int,
      map['randomNumber'] != null ? map['randomNumber'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RandomNumberGenerator.fromJson(String source) =>
      RandomNumberGenerator.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RandomNumberGenerator(minValue: $minValue, maxValue: $maxValue, randomNumber: $randomNumber)';

  @override
  bool operator ==(covariant RandomNumberGenerator other) {
    if (identical(this, other)) return true;

    return other.minValue == minValue &&
        other.maxValue == maxValue &&
        other.randomNumber == randomNumber;
  }

  @override
  int get hashCode =>
      minValue.hashCode ^ maxValue.hashCode ^ randomNumber.hashCode;
}
