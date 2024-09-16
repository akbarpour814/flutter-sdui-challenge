import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/repository/car_management_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/local/car_management_local_data_source.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/remote/car_management_remote_data_source.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

// Generate the mocks for the required data sources
@GenerateMocks([ICarManagementRemoteDataSource, ICarManagementLocalDataSource])
void main() {
  late CarManagementRepositoryImpl repository;
  late ICarManagementRemoteDataSource mockRemoteDataSource;
  late ICarManagementLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockICarManagementRemoteDataSource();
    mockLocalDataSource = MockICarManagementLocalDataSource();
    repository = CarManagementRepositoryImpl();
    getIt.registerSingleton<ICarManagementRemoteDataSource>(
        mockRemoteDataSource);
    getIt.registerSingleton<ICarManagementLocalDataSource>(mockLocalDataSource);
  });

  tearDown(
    () {
      getIt.reset();
    },
  );

  group('CarManagementRepositoryImpl Tests', () {

    test('should return DataError when getFormFields fails', () async {
      when(mockRemoteDataSource.getFormFields()).thenThrow(Exception('Error'));

      final result = await repository.getFormFields();

      expect(result, isA<DataError>());
    });

    test('should return DataSuccess when getFormFields is successful',
        () async {
      final response = Response(
        data: '<html>{"fields": [{"name": "testField"}]}</html>',
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockRemoteDataSource.getFormFields())
          .thenAnswer((_) async => response);

      final result = await repository.getFormFields();

      expect(result, isA<DataSuccess>());
    });


    test('should return DataSuccess when addNewCar is successful', () async {
      final carAttributes = [
        CarAttributeModel(
            attrName: 'Color',
            attrValue: 'Red',
            attrLabel: '',
            fileBytes: [],
            id: 0)
      ];

      when(mockLocalDataSource.addNewCar([])).thenAnswer((_) async => null);

      final result = await repository.addNewCar(carAttributes);

      expect(result, isA<DataSuccess>());
    });

    test('should return DataError when addNewCar fails', () async {
      when(mockLocalDataSource.addNewCar([]))
          .thenThrow(Exception('Add Car Error'));

      final result = await repository.addNewCar([]);

      expect(result, isA<DataError>());
    });

    test('should return DataSuccess when deleteCar is successful', () async {
      when(mockLocalDataSource.deleteCar(1)).thenAnswer((_) async => null);

      final result = await repository.deleteCar(1);

      expect(result, isA<DataSuccess>());
    });

    test('should return DataError when deleteCar fails', () async {
      when(mockLocalDataSource.deleteCar(1))
          .thenThrow(Exception('Delete Car Error'));

      final result = await repository.deleteCar(1);

      expect(result, isA<DataError>());
    });

    test(
        'should return DataSuccess with list of cars when getAllCars is successful',
        () async {
      final carsResponse = [GetCarsResponseModel(id: 1, data: [])];

      when(mockLocalDataSource.getAllCars())
          .thenAnswer((_) async => carsResponse);

      final result = await repository.getAllCars();

      expect(result, isA<DataSuccess>());
    });

    test('should return DataError when getAllCars fails', () async {
      when(mockLocalDataSource.getAllCars())
          .thenThrow(Exception('Get Cars Error'));

      final result = await repository.getAllCars();

      expect(result, isA<DataError>());
    });
  });
}
