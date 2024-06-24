// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:kro_trust_task/core/base/base_state.bloc.dart';
// import 'package:kro_trust_task/modules/transfers/data/datasources/transfer_datasource.dart';
// import 'package:kro_trust_task/modules/transfers/data/datasources/transfer_datasource_impl.dart';
// import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
// import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
// import 'package:kro_trust_task/modules/transfers/data/repository/transfer_repository.dart';
// import 'package:kro_trust_task/modules/transfers/domain/repository/transfer_repository_impl.dart';
// import 'package:kro_trust_task/modules/transfers/domain/usecases/transfer_money_usecase.dart';
// import 'package:kro_trust_task/modules/transfers/presentation/bloc/transfer/transfer_bloc.dart';
// import 'package:mockito/mockito.dart';

// import '../../../../../core/mock_data.dart';

// import '../../../data/datasources/transfer_datasource_test.mocks.dart';

// void main() {
//   late TransferDataSource transferDatasource;
//   late TransferRepository transferRepository;
//   late TransferMoneyUseCase transferUseCase;

//   setUpAll(() {
//     transferDatasource = MockTransferDataSource();
//     transferRepository = TransferRepositoryImpl(dataSource: transferDatasource);
//     transferUseCase =
//         TransferMoneyUseCase(transferRepository: transferRepository);
//     const dto = TransferDto(accountNumber: '0220824612', amount: 100);
//     when(transferDatasource.transferMoney(transferDto: dto)).thenAnswer(
//         (_) async => TransferResponse.fromJson(mockTransferResponse));
//   });

//   group('transfer bloc', () {
//     blocTest<TransferBloc, BaseBlocState<TransferResponse>>(
//         'emits transfer success response when transfer money event is added.',
//         build: () => TransferBloc(transferMoneyUseCase: transferUseCase),
//         act: (bloc) {
//           // const dto = TransferDto(accountNumber: '0220824612', amount: 100);
//           bloc.add(TransferEvent.transferMoney());
//         },
//         expect: () => <BaseBlocState<TransferResponse>>[
//               const BaseBlocState.loading(),
//               BaseBlocState.next(
//                   TransferResponse.fromJson(mockTransferResponse)),
//             ]);
//   });
// }
