// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['access_token'] as String?,
      userName: json['user_name'] as String?,
      id: json['id'] as String?,
      savingsBalance: (json['savings_balance'] as num?)?.toInt(),
      checkingsBalance: (json['checkings_balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user_name': instance.userName,
      'id': instance.id,
      'savings_balance': instance.savingsBalance,
      'checkings_balance': instance.checkingsBalance,
    };
