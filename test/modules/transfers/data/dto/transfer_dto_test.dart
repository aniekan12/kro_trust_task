import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';

void main() {
  group('TransferDto', () {
    test('props should return correct values', () {
      const transferDto =
          TransferDto(accountNumber: '1234567890', amount: 100.0);
      expect(transferDto.props, equals(['1234567890', 100.0]));
    });
  });
}
