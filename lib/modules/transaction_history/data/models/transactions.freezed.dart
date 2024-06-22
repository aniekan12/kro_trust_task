// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  List<TransactionData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call({List<TransactionData> data});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionData> data});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$TransactionImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl({required final List<TransactionData> data})
      : _data = data;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  final List<TransactionData> _data;
  @override
  List<TransactionData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'Transaction(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction({required final List<TransactionData> data}) =
      _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  List<TransactionData> get data;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) {
  return _TransactionData.fromJson(json);
}

/// @nodoc
mixin _$TransactionData {
  String? get date => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDataCopyWith<TransactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDataCopyWith<$Res> {
  factory $TransactionDataCopyWith(
          TransactionData value, $Res Function(TransactionData) then) =
      _$TransactionDataCopyWithImpl<$Res, TransactionData>;
  @useResult
  $Res call({String? date, String? type, String? amount, String? description});
}

/// @nodoc
class _$TransactionDataCopyWithImpl<$Res, $Val extends TransactionData>
    implements $TransactionDataCopyWith<$Res> {
  _$TransactionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDataImplCopyWith<$Res>
    implements $TransactionDataCopyWith<$Res> {
  factory _$$TransactionDataImplCopyWith(_$TransactionDataImpl value,
          $Res Function(_$TransactionDataImpl) then) =
      __$$TransactionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, String? type, String? amount, String? description});
}

/// @nodoc
class __$$TransactionDataImplCopyWithImpl<$Res>
    extends _$TransactionDataCopyWithImpl<$Res, _$TransactionDataImpl>
    implements _$$TransactionDataImplCopyWith<$Res> {
  __$$TransactionDataImplCopyWithImpl(
      _$TransactionDataImpl _value, $Res Function(_$TransactionDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? description = freezed,
  }) {
    return _then(_$TransactionDataImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDataImpl implements _TransactionData {
  const _$TransactionDataImpl(
      {this.date, this.type, this.amount, this.description});

  factory _$TransactionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionDataImplFromJson(json);

  @override
  final String? date;
  @override
  final String? type;
  @override
  final String? amount;
  @override
  final String? description;

  @override
  String toString() {
    return 'TransactionData(date: $date, type: $type, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, type, amount, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDataImplCopyWith<_$TransactionDataImpl> get copyWith =>
      __$$TransactionDataImplCopyWithImpl<_$TransactionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDataImplToJson(
      this,
    );
  }
}

abstract class _TransactionData implements TransactionData {
  const factory _TransactionData(
      {final String? date,
      final String? type,
      final String? amount,
      final String? description}) = _$TransactionDataImpl;

  factory _TransactionData.fromJson(Map<String, dynamic> json) =
      _$TransactionDataImpl.fromJson;

  @override
  String? get date;
  @override
  String? get type;
  @override
  String? get amount;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$TransactionDataImplCopyWith<_$TransactionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
