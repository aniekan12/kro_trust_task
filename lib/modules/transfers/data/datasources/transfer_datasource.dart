import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';

abstract class TransferDataSource {
  Future<TransferResponse> transferMoney({required TransferDto transferDto});
}
