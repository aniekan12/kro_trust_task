import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/modules/transfers/data/datasources/transfer_datasource.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/mock_data.dart';
import 'transfer_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TransferDataSource>()])
void main() {
  group('TransferDataSource', () {
    late TransferDataSource dataSource;

    setUp(() {
      dataSource = MockTransferDataSource();
    });

    test(
        'transfer money should call the correct method and return the correct response',
        () async {
      const dto = TransferDto(accountNumber: '1234567890', amount: 200);
      final response = TransferResponse.fromJson(mockTransferResponse);

      when(dataSource.transferMoney(transferDto: dto))
          .thenAnswer((_) async => response);

      final result = await dataSource.transferMoney(transferDto: dto);

      expect(result, response);
      verify(dataSource.transferMoney(transferDto: dto)).called(1);
    });
  });
}
