import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'user_name') String? userName,
    String? id,
    @JsonKey(name: "savings_balance") int? savingsBalance,
    @JsonKey(name: "checkings_balance") int? checkingsBalance,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
