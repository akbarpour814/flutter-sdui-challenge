
import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/remote/car_management_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  group('CarManagementRemoteDataSource ', () {
    final mockDio = MockDio();
    final repo = CarManagementRemoteDataSource();

    setUp(() {
      getIt.registerSingleton<Dio>(mockDio);
    });

    tearDown(() {
      getIt.reset();
    });

    test('should getFormFields from github successfully', () async {
      when(mockDio.get(any)).thenAnswer(
          (_) async => Future.value(Response(
              data: {"": ""},
              statusCode: 200,
              requestOptions: RequestOptions(
                  path: '') // add this to match the request options
              )));

      await repo.getFormFields();

      verify(mockDio.get(any,
      )).called(1);
    });
  });
}
