import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/core/mocks/mock_responses.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/utils/future_extensions.dart';

import 'transfer_datasource.dart';

class TransferDatasourceImpl implements TransferDataSource {
  @override
  Future<TransferResponse> transferMoney(
      {required TransferDto transferDto}) async {
    try {
      if (transferDto.accountNumber.isNotEmpty) {
        await delay(5.seconds);
        return TransferResponse.fromJson(mockTransferResponse);
      } else {
        throw KroException.fromMessage('Insufficent Balance');
      }
    } catch (e) {
      throw KroException.fromMessage('Insufficient Balanace');
    }
  }
}
