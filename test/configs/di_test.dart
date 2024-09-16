
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


// Mock classes for Dio and Hive
class MockDio extends Mock implements Dio {}

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.reset();
  });

  group('Dio Client Tests', () {
    test('should create Dio client with correct configurations', () {
      final dio = createApiClient();

      // Check base URL and timeouts
      expect(dio.options.baseUrl, 'https://github.com/');
      expect(dio.options.connectTimeout, const Duration(seconds: 30));
      expect(dio.options.sendTimeout, const Duration(seconds: 30));
      expect(dio.options.receiveTimeout, const Duration(seconds: 30));
    });

    test('should add interceptors to Dio client', () {
      final dio = createApiClient();

      // Check that interceptors are added
      expect(dio.interceptors.length, greaterThan(0));
    });
  });
}
