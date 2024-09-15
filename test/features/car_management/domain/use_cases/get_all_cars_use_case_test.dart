import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/use_cases/get_all_cars_use_case.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late MockICarManagementRepository mockICarManagementRepository;
  late GetAllCarsUseCase getallcarsusecase;

  setUp(() {
    mockICarManagementRepository = MockICarManagementRepository();
    getallcarsusecase = GetAllCarsUseCase();
    getIt.registerFactory<ICarManagementRepository>(() => mockICarManagementRepository);
  });

  tearDown(() {
    getIt.reset();
  });

  group('GetAllCarsUseCase tests', () {

    test('should return DataSuccess when repository call is successful', () async {
      final expectedResponse = DataSuccess<List<GetCarsResponseModel>>([]);

      when(mockICarManagementRepository.getAllCars())
          .thenAnswer((_) async => expectedResponse);

      final result = await getallcarsusecase.call();

      expect(result, isA<DataSuccess>());
      verify(mockICarManagementRepository.getAllCars()).called(1);
    });

    test('should return DataError when repository call fails', () async {
      final expectedResponse = DataError<List<GetCarsResponseModel>>('Error');

      when(mockICarManagementRepository.getAllCars())
          .thenAnswer((_) async => expectedResponse);

      final result = await getallcarsusecase.call();

      expect(result, isA<DataError>());
      verify(mockICarManagementRepository.getAllCars()).called(1);
    });
  });
}
