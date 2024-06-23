import 'package:flutter_test/flutter_test.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/transfers/data/datasources/transfer_datasource.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/data/repository/transfer_repository.dart';
import 'package:kro_trust_task/modules/transfers/domain/repository/transfer_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/mock_data.dart';
import '../datasources/transfer_datasource_test.mocks.dart';

void main() {
  late TransferDataSource transferDataSource;
  late TransferRepository transferRepository;
  setUp(() {
    transferDataSource = MockTransferDataSource();
    transferRepository = TransferRepositoryImpl(dataSource: transferDataSource);
  });

  group('user repository', () {
    test('should return login response', () async {
      const dto = TransferDto(
        accountNumber: '1234567890',
        amount: 100,
      );
      final response = TransferResponse.fromJson(mockTransferResponse);

      when(transferDataSource.transferMoney(transferDto: dto))
          .thenAnswer((_) async => response);
      final res = await transferRepository.transferMoney(dto: dto);
      res.fold(
        (l) => expect(l, isA<KroException>()),
        (r) => expect(r, isA<TransferResponse>()),
      );
    });
  });
}
