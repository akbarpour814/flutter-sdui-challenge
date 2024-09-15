import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:injectable/injectable.dart';

abstract class ICarManagementRemoteDataSource {
  Future<Response> getFormFields();
}

@Injectable(
  as: ICarManagementRemoteDataSource,
)
class CarManagementRemoteDataSource implements ICarManagementRemoteDataSource {
  @override
  Future<Response> getFormFields() => getIt<Dio>()
      .get('ArmanCreativeSolutions/flutter-sdui-challenge/tree/main');
}
