import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/use_cases/delete_car_use_case.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late MockICarManagementRepository mockICarManagementRepository;
  late DeleteCarUseCase deletecarusecase;

  setUp(() {
    mockICarManagementRepository = MockICarManagementRepository();
    deletecarusecase = DeleteCarUseCase();
    getIt.registerFactory<ICarManagementRepository>(() => mockICarManagementRepository);
  });

  tearDown(() {
    getIt.reset();
  });

  group('DeleteCarUseCase tests', () {

    test('should return DataSuccess when repository call is successful', () async {
      const param = 0;  // Adjust this with real parameters
      final expectedResponse = DataSuccess(true);

      when(mockICarManagementRepository.deleteCar(param))
          .thenAnswer((_) async => expectedResponse);

      final result = await deletecarusecase.call(param);

      expect(result, isA<DataSuccess>());
      verify(mockICarManagementRepository.deleteCar(param)).called(1);
    });

    test('should return DataError when repository call fails', () async {
      final expectedResponse = DataError('Error');

      const param = 0;
      when(mockICarManagementRepository.deleteCar(param))
          .thenAnswer((_) async => expectedResponse);

      final result = await deletecarusecase.call(param);

      expect(result, isA<DataError>());
      verify(mockICarManagementRepository.deleteCar(0)).called(1);
    });
  });
}
