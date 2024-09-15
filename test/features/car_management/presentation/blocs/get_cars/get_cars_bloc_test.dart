
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/get_cars/get_cars_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late GetCarsBloc bloc;
  late MockICarManagementRepository mockRepository;

  setUp(() {
    mockRepository = MockICarManagementRepository();
    getIt.registerFactory<ICarManagementRepository>(() => mockRepository);
    bloc = GetCarsBloc();
  });

  tearDown(() {
    getIt.reset();
  });

  blocTest<GetCarsBloc, GetCarsState>(
    'emits [isA<GetCarsLoading>(), isA<GetCarsLoaded>()] when GetCarsRequestEvent is added and call is successful',
    build: () {
      final mockResponse = DataSuccess<List<GetCarsResponseModel>>([]);
      when(mockRepository.getAllCars())
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(GetCarsRequestEvent()),
    expect: () => [
      isA<GetCarsLoading>(), isA<GetCarsLoaded>(),
    ],
  );

  blocTest<GetCarsBloc, GetCarsState>(
    'emits [isA<GetCarsLoading>(), isA<GetCarsError>()] when GetCarsRequestEvent is added and call fails',
    build: () {
      final mockResponse = DataError<List<GetCarsResponseModel>>('error');
      when(mockRepository.getAllCars())
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(GetCarsRequestEvent()),
    expect: () => [
      isA<GetCarsLoading>(), isA<GetCarsError>(),
    ],
  );
}