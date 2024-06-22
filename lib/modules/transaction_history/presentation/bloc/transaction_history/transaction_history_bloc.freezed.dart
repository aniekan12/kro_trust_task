// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTransactionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTransactionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTransactionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTransactionHistory value)
        fetchTransactionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTransactionHistory value)? fetchTransactionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTransactionHistory value)? fetchTransactionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryEventCopyWith<$Res> {
  factory $TransactionHistoryEventCopyWith(TransactionHistoryEvent value,
          $Res Function(TransactionHistoryEvent) then) =
      _$TransactionHistoryEventCopyWithImpl<$Res, TransactionHistoryEvent>;
}

/// @nodoc
class _$TransactionHistoryEventCopyWithImpl<$Res,
        $Val extends TransactionHistoryEvent>
    implements $TransactionHistoryEventCopyWith<$Res> {
  _$TransactionHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchTransactionHistoryImplCopyWith<$Res> {
  factory _$$FetchTransactionHistoryImplCopyWith(
          _$FetchTransactionHistoryImpl value,
          $Res Function(_$FetchTransactionHistoryImpl) then) =
      __$$FetchTransactionHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchTransactionHistoryImplCopyWithImpl<$Res>
    extends _$TransactionHistoryEventCopyWithImpl<$Res,
        _$FetchTransactionHistoryImpl>
    implements _$$FetchTransactionHistoryImplCopyWith<$Res> {
  __$$FetchTransactionHistoryImplCopyWithImpl(
      _$FetchTransactionHistoryImpl _value,
      $Res Function(_$FetchTransactionHistoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchTransactionHistoryImpl implements _FetchTransactionHistory {
  _$FetchTransactionHistoryImpl();

  @override
  String toString() {
    return 'TransactionHistoryEvent.fetchTransactionHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchTransactionHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTransactionHistory,
  }) {
    return fetchTransactionHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTransactionHistory,
  }) {
    return fetchTransactionHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTransactionHistory,
    required TResult orElse(),
  }) {
    if (fetchTransactionHistory != null) {
      return fetchTransactionHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTransactionHistory value)
        fetchTransactionHistory,
  }) {
    return fetchTransactionHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTransactionHistory value)? fetchTransactionHistory,
  }) {
    return fetchTransactionHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTransactionHistory value)? fetchTransactionHistory,
    required TResult orElse(),
  }) {
    if (fetchTransactionHistory != null) {
      return fetchTransactionHistory(this);
    }
    return orElse();
  }
}

abstract class _FetchTransactionHistory implements TransactionHistoryEvent {
  factory _FetchTransactionHistory() = _$FetchTransactionHistoryImpl;
}
