// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => TransactionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$TransactionDataImpl _$$TransactionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDataImpl(
      date: json['date'] as String?,
      type: json['type'] as String?,
      amount: json['amount'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$TransactionDataImplToJson(
        _$TransactionDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'type': instance.type,
      'amount': instance.amount,
      'description': instance.description,
    };
