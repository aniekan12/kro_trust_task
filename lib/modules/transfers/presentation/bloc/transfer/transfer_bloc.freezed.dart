// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferEvent {
  TransferDto get transferDto => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransferDto transferDto) transferMoney,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransferDto transferDto)? transferMoney,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransferDto transferDto)? transferMoney,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransferMoney value) transferMoney,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransferMoney value)? transferMoney,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransferMoney value)? transferMoney,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransferEventCopyWith<TransferEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferEventCopyWith<$Res> {
  factory $TransferEventCopyWith(
          TransferEvent value, $Res Function(TransferEvent) then) =
      _$TransferEventCopyWithImpl<$Res, TransferEvent>;
  @useResult
  $Res call({TransferDto transferDto});
}

/// @nodoc
class _$TransferEventCopyWithImpl<$Res, $Val extends TransferEvent>
    implements $TransferEventCopyWith<$Res> {
  _$TransferEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferDto = null,
  }) {
    return _then(_value.copyWith(
      transferDto: null == transferDto
          ? _value.transferDto
          : transferDto // ignore: cast_nullable_to_non_nullable
              as TransferDto,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferMoneyImplCopyWith<$Res>
    implements $TransferEventCopyWith<$Res> {
  factory _$$TransferMoneyImplCopyWith(
          _$TransferMoneyImpl value, $Res Function(_$TransferMoneyImpl) then) =
      __$$TransferMoneyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransferDto transferDto});
}

/// @nodoc
class __$$TransferMoneyImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$TransferMoneyImpl>
    implements _$$TransferMoneyImplCopyWith<$Res> {
  __$$TransferMoneyImplCopyWithImpl(
      _$TransferMoneyImpl _value, $Res Function(_$TransferMoneyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferDto = null,
  }) {
    return _then(_$TransferMoneyImpl(
      transferDto: null == transferDto
          ? _value.transferDto
          : transferDto // ignore: cast_nullable_to_non_nullable
              as TransferDto,
    ));
  }
}

/// @nodoc

class _$TransferMoneyImpl implements _TransferMoney {
  _$TransferMoneyImpl({required this.transferDto});

  @override
  final TransferDto transferDto;

  @override
  String toString() {
    return 'TransferEvent.transferMoney(transferDto: $transferDto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferMoneyImpl &&
            (identical(other.transferDto, transferDto) ||
                other.transferDto == transferDto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transferDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferMoneyImplCopyWith<_$TransferMoneyImpl> get copyWith =>
      __$$TransferMoneyImplCopyWithImpl<_$TransferMoneyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TransferDto transferDto) transferMoney,
  }) {
    return transferMoney(transferDto);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransferDto transferDto)? transferMoney,
  }) {
    return transferMoney?.call(transferDto);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransferDto transferDto)? transferMoney,
    required TResult orElse(),
  }) {
    if (transferMoney != null) {
      return transferMoney(transferDto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransferMoney value) transferMoney,
  }) {
    return transferMoney(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransferMoney value)? transferMoney,
  }) {
    return transferMoney?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransferMoney value)? transferMoney,
    required TResult orElse(),
  }) {
    if (transferMoney != null) {
      return transferMoney(this);
    }
    return orElse();
  }
}

abstract class _TransferMoney implements TransferEvent {
  factory _TransferMoney({required final TransferDto transferDto}) =
      _$TransferMoneyImpl;

  @override
  TransferDto get transferDto;
  @override
  @JsonKey(ignore: true)
  _$$TransferMoneyImplCopyWith<_$TransferMoneyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
