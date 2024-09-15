
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/delete_car/delete_car_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late DeleteCarBloc bloc;
  late MockICarManagementRepository mockRepository;

  setUp(() {
    mockRepository = MockICarManagementRepository();
    getIt.registerFactory<ICarManagementRepository>(() => mockRepository);
    bloc = DeleteCarBloc();
  });

  tearDown(() {
    getIt.reset();
  });

  blocTest<DeleteCarBloc, DeleteCarState>(
    'emits [isA<DeleteCarLoading>(), isA<DeleteCarSuccess>()] when DeleteCarRequestEvent is added and call is successful',
    build: () {
      final mockResponse = DataSuccess(null);
      when(mockRepository.deleteCar(any))
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(DeleteCarRequestEvent(id : 0)),
    expect: () => [
      isA<DeleteCarLoading>(), isA<DeleteCarSuccess>(),
    ],
  );

  blocTest<DeleteCarBloc, DeleteCarState>(
    'emits [isA<DeleteCarLoading>(), isA<DeleteCarError>()] when DeleteCarRequestEvent is added and call fails',
    build: () {
      final mockResponse = DataError('error');
      when(mockRepository.deleteCar(any))
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(DeleteCarRequestEvent(id : 0)),
    expect: () => [
      isA<DeleteCarLoading>(), isA<DeleteCarError>(),
    ],
  );
}