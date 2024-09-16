import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/local/car_management_local_data_source.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/remote/car_management_remote_data_source.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:injectable/injectable.dart';

Response<dynamic>? _getFormFieldsRes;

@Injectable(
  as: ICarManagementRepository,
)
class CarManagementRepositoryImpl implements ICarManagementRepository {
  @override
  Future<DataState<FormFieldsResponseModel>> getFormFields() async {
    try {
      //if runtime cache is valid and not empty
      if (_getFormFieldsRes != null && _getFormFieldsRes!.statusCode == 200) {
        return DataSuccess(FormFieldsResponseModel.fromJson(
            _extractJsonFromHtml(_getFormFieldsRes!)));
      }
      //filled runtime cache
      _getFormFieldsRes =
          await getIt<ICarManagementRemoteDataSource>().getFormFields();
      if (_getFormFieldsRes != null && _getFormFieldsRes!.statusCode == 200) {
        return DataSuccess(FormFieldsResponseModel.fromJson(
            _extractJsonFromHtml(_getFormFieldsRes!)));
      }
      return DataError('خطا در دریافت اطلاعات');
    } catch (e) {
      return DataError('خطا در دریافت اطلاعات');
    }
  }

  Map<String, dynamic> _extractJsonFromHtml(Response<dynamic> res) {
    try {
      return jsonDecode(
          '''{"fields${res.data.split('fields').last.split('}]}\n').first}}]}"'''
              .replaceAll('&quot;', '''"''').replaceAll(
                  '''"{''', '''{''').replaceAll('''}"''', '''}'''));
    } catch (e) {
      return {};
    }
  }

  @override
  Future<DataState> addNewCar(List<CarAttributeModel> request) async {
    try {
      await getIt<ICarManagementLocalDataSource>().addNewCar(request);
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
  }

  @override
  Future<DataState> deleteCar(int id) async {
    try {
      await getIt<ICarManagementLocalDataSource>().deleteCar(id);
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
  }

  @override
  Future<DataState<List<GetCarsResponseModel>>> getAllCars() async {
    try {
      final res = await getIt<ICarManagementLocalDataSource>().getAllCars();
      return DataSuccess(res);
    } catch (e) {
      return DataError(e.toString());
    }
  }
}
