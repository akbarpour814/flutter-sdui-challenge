import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/configs/di.config.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  getIt.registerSingleton<Dio>(
    createApiClient(),
  );
  getIt.init();
  await initializeHive();
}

//configure dio api client instance
Dio createApiClient() {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://github.com/',
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)));
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        log("error: ${e.toString()}\n");
        handler.reject(e);
      },
      onRequest: (request, handler) async {
        try {
          log(
            'Request=> ${request.baseUrl}${request.path}'
            '\n'
            'Body=> ${request.data}'
            '\n'
            'Params=> ${request.queryParameters}'
            '\n',
          );
          handler.next(request);
        } catch (e) {
          print(e);
        }
      },
      onResponse: (response, handler) async {
        log(
          'Response=> ${response.realUri} '
          '\n'
          'StatusCode=> ${response.statusCode} '
          '\n'
          'Data=> ${response.data}',
        );
        handler.resolve(response);
      },
    ),
  );

  return dio;
}

//initilize hive db
Future<void> initializeHive() async {
  await Hive.initFlutter();
  //check if adapter already registerd
  if (!Hive.isAdapterRegistered(CarAttributeModelAdapter().typeId)) {
    Hive.registerAdapter(CarAttributeModelAdapter());
  }
}
