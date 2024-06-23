import 'package:flutter_test/flutter_test.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/transfers/data/datasources/transfer_datasource.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/data/repository/transfer_repository.dart';
import 'package:kro_trust_task/modules/transfers/domain/repository/transfer_repository_impl.dart';
import 'package:kro_trust_task/modules/transfers/domain/usecases/transfer_money_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/mock_data.dart';
import '../../data/datasources/transfer_datasource_test.mocks.dart';

void main() async {
  late TransferDataSource apiDataSource;
  late TransferRepository repository;
  late TransferMoneyUseCase useCase;
  setUp(() {
    apiDataSource = MockTransferDataSource();
    repository = TransferRepositoryImpl(dataSource: apiDataSource);
    useCase = TransferMoneyUseCase(transferRepository: repository);
  });

  test('should verify transfer is successful', () async {
    const dto = TransferDto(accountNumber: '1234567890', amount: 100);
    when(apiDataSource.transferMoney(transferDto: dto)).thenAnswer(
        (_) async => TransferResponse.fromJson(mockTransferResponse));

    final res = await useCase.invoke(dto);
    res.fold(
      (l) => expect(l, isA<KroException>()),
      (r) => expect(r, isA<TransferResponse>()),
    );
    verify(apiDataSource.transferMoney(transferDto: dto)).called(1);
  });
}
