
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/add_new_car/add_new_car_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late AddNewCarBloc bloc;
  late MockICarManagementRepository mockRepository;

  setUp(() {
    mockRepository = MockICarManagementRepository();
    getIt.registerFactory<ICarManagementRepository>(() => mockRepository);
    bloc = AddNewCarBloc();
  });

  tearDown(() {
    getIt.reset();
  });

  blocTest<AddNewCarBloc, AddNewCarState>(
    'emits [isA<AddNewCarLoading>(), isA<AddNewCarSuccess>()] when AddNewCarRequestEvent is added and call is successful',
    build: () {
      final mockResponse = DataSuccess(null);
      when(mockRepository.addNewCar(any))
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(AddNewCarRequestEvent(request : const [])),
    expect: () => [
      isA<AddNewCarLoading>(), isA<AddNewCarSuccess>(),
    ],
  );

  blocTest<AddNewCarBloc, AddNewCarState>(
    'emits [isA<AddNewCarLoading>(), isA<AddNewCarError>()] when AddNewCarRequestEvent is added and call fails',
    build: () {
      final mockResponse = DataError('error');
      when(mockRepository.addNewCar(any))
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(AddNewCarRequestEvent(request : const [])),
    expect: () => [
      isA<AddNewCarLoading>(), isA<AddNewCarError>(),
    ],
  );
}