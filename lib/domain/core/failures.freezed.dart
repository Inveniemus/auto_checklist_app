// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

// ignore: unused_element
  TooLongResponse<T> looLongResponse<T>({@required T failedValue}) {
    return TooLongResponse<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result looLongResponse(T failedValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result looLongResponse(T failedValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result looLongResponse(TooLongResponse<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result looLongResponse(TooLongResponse<T> value),
    @required Result orElse(),
  });

  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
abstract class $TooLongResponseCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $TooLongResponseCopyWith(
          TooLongResponse<T> value, $Res Function(TooLongResponse<T>) then) =
      _$TooLongResponseCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$TooLongResponseCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $TooLongResponseCopyWith<T, $Res> {
  _$TooLongResponseCopyWithImpl(
      TooLongResponse<T> _value, $Res Function(TooLongResponse<T>) _then)
      : super(_value, (v) => _then(v as TooLongResponse<T>));

  @override
  TooLongResponse<T> get _value => super._value as TooLongResponse<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(TooLongResponse<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$TooLongResponse<T>
    with DiagnosticableTreeMixin
    implements TooLongResponse<T> {
  const _$TooLongResponse({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.looLongResponse(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.looLongResponse'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TooLongResponse<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $TooLongResponseCopyWith<T, TooLongResponse<T>> get copyWith =>
      _$TooLongResponseCopyWithImpl<T, TooLongResponse<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result looLongResponse(T failedValue),
  }) {
    assert(looLongResponse != null);
    return looLongResponse(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result looLongResponse(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (looLongResponse != null) {
      return looLongResponse(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result looLongResponse(TooLongResponse<T> value),
  }) {
    assert(looLongResponse != null);
    return looLongResponse(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result looLongResponse(TooLongResponse<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (looLongResponse != null) {
      return looLongResponse(this);
    }
    return orElse();
  }
}

abstract class TooLongResponse<T> implements ValueFailure<T> {
  const factory TooLongResponse({@required T failedValue}) =
      _$TooLongResponse<T>;

  @override
  T get failedValue;
  @override
  $TooLongResponseCopyWith<T, TooLongResponse<T>> get copyWith;
}
