// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'random_number_generator_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RandomNumberGeneratorFreezed {
  int get minValue => throw _privateConstructorUsedError;
  int get maxValue => throw _privateConstructorUsedError;
  int? get randomNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RandomNumberGeneratorFreezedCopyWith<RandomNumberGeneratorFreezed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomNumberGeneratorFreezedCopyWith<$Res> {
  factory $RandomNumberGeneratorFreezedCopyWith(
          RandomNumberGeneratorFreezed value,
          $Res Function(RandomNumberGeneratorFreezed) then) =
      _$RandomNumberGeneratorFreezedCopyWithImpl<$Res,
          RandomNumberGeneratorFreezed>;
  @useResult
  $Res call({int minValue, int maxValue, int? randomNumber});
}

/// @nodoc
class _$RandomNumberGeneratorFreezedCopyWithImpl<$Res,
        $Val extends RandomNumberGeneratorFreezed>
    implements $RandomNumberGeneratorFreezedCopyWith<$Res> {
  _$RandomNumberGeneratorFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minValue = null,
    Object? maxValue = null,
    Object? randomNumber = freezed,
  }) {
    return _then(_value.copyWith(
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      randomNumber: freezed == randomNumber
          ? _value.randomNumber
          : randomNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RandomNumberGeneratorFreezedCopyWith<$Res>
    implements $RandomNumberGeneratorFreezedCopyWith<$Res> {
  factory _$$_RandomNumberGeneratorFreezedCopyWith(
          _$_RandomNumberGeneratorFreezed value,
          $Res Function(_$_RandomNumberGeneratorFreezed) then) =
      __$$_RandomNumberGeneratorFreezedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minValue, int maxValue, int? randomNumber});
}

/// @nodoc
class __$$_RandomNumberGeneratorFreezedCopyWithImpl<$Res>
    extends _$RandomNumberGeneratorFreezedCopyWithImpl<$Res,
        _$_RandomNumberGeneratorFreezed>
    implements _$$_RandomNumberGeneratorFreezedCopyWith<$Res> {
  __$$_RandomNumberGeneratorFreezedCopyWithImpl(
      _$_RandomNumberGeneratorFreezed _value,
      $Res Function(_$_RandomNumberGeneratorFreezed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minValue = null,
    Object? maxValue = null,
    Object? randomNumber = freezed,
  }) {
    return _then(_$_RandomNumberGeneratorFreezed(
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      randomNumber: freezed == randomNumber
          ? _value.randomNumber
          : randomNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RandomNumberGeneratorFreezed implements _RandomNumberGeneratorFreezed {
  const _$_RandomNumberGeneratorFreezed(
      {required this.minValue,
      required this.maxValue,
      required this.randomNumber});

  @override
  final int minValue;
  @override
  final int maxValue;
  @override
  final int? randomNumber;

  @override
  String toString() {
    return 'RandomNumberGeneratorFreezed(minValue: $minValue, maxValue: $maxValue, randomNumber: $randomNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RandomNumberGeneratorFreezed &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.randomNumber, randomNumber) ||
                other.randomNumber == randomNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, minValue, maxValue, randomNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RandomNumberGeneratorFreezedCopyWith<_$_RandomNumberGeneratorFreezed>
      get copyWith => __$$_RandomNumberGeneratorFreezedCopyWithImpl<
          _$_RandomNumberGeneratorFreezed>(this, _$identity);
}

abstract class _RandomNumberGeneratorFreezed
    implements RandomNumberGeneratorFreezed {
  const factory _RandomNumberGeneratorFreezed(
      {required final int minValue,
      required final int maxValue,
      required final int? randomNumber}) = _$_RandomNumberGeneratorFreezed;

  @override
  int get minValue;
  @override
  int get maxValue;
  @override
  int? get randomNumber;
  @override
  @JsonKey(ignore: true)
  _$$_RandomNumberGeneratorFreezedCopyWith<_$_RandomNumberGeneratorFreezed>
      get copyWith => throw _privateConstructorUsedError;
}
