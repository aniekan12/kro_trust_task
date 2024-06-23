import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_response.freezed.dart';
part 'transfer_response.g.dart';

@freezed
class TransferResponse with _$TransferResponse {
  const factory TransferResponse({
    String? amount,
    String? message,
    String? description,
    String? recepient,
  }) = _TransferResponse;

  factory TransferResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferResponseFromJson(json);
}
