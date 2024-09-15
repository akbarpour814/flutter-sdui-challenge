import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/remote/car_management_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/repository/car_management_repository_impl.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late CarManagementRepositoryImpl repository;
  late MockICarManagementRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockICarManagementRemoteDataSource();
    repository = CarManagementRepositoryImpl();
    getIt.registerSingleton<ICarManagementRemoteDataSource>(mockDataSource);
  });

  tearDown(() {
    getIt.reset();
  });

  test('getFormFields should call getFormFields on success', () async {
    final response = Response(requestOptions: RequestOptions(),statusCode: 200);
    when(mockDataSource.getFormFields()).thenAnswer((_) async => response);

    final result = await repository.getFormFields();
    verify(mockDataSource.getFormFields()).called(1);
    expect(result, isA<DataSuccess>());
  });
  
  test('getFormFields should call getFormFields on failed', () async {
    final response = Response(requestOptions: RequestOptions(),statusCode: 400);
    when(mockDataSource.getFormFields()).thenAnswer((_) async => response);

    final result = await repository.getFormFields();
    verify(mockDataSource.getFormFields()).called(1);
    expect(result, isA<DataError>());
  });
  
  test('getFormFields should call getFormFields on failed Exception', () async {
    final response = Response(requestOptions: RequestOptions(),statusCode: 500);
    when(mockDataSource.getFormFields()).thenThrow((_) async => response);

    final result = await repository.getFormFields();
    verify(mockDataSource.getFormFields()).called(1);
    expect(result, isA<DataError>());
  });
}
