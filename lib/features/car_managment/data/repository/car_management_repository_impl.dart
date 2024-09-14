import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/source/local/car_management_local_data_source.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/source/remote/car_management_remote_data_source.dart';
import 'package:flutter_sdui_challenge/features/car_managment/domain/repository/car_management_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(
  as: ICarManagementRepository,
)
class CarManagementRepository implements ICarManagementRepository {
  @override
  Future<DataState<FormFieldsResponseModel>> getFormFields() async {
    try {
      final res = await getIt<ICarManagementRemoteDataSource>().getFormFields();
      if (res.statusCode == 200) {
        return DataSuccess(
            FormFieldsResponseModel.fromJson(_extractJsonFromHtml(res)));
      }
      return DataError('خطا در دریافت اطلاعات');
    } catch (e) {
      return DataError('خطا در دریافت اطلاعات');
    }
  }

  Map<String, dynamic> _extractJsonFromHtml(Response<dynamic> res) {
    return jsonDecode(
        '''{"fields${res.data.split('fields').last.split('}]}\n').first}}]}"'''
            .replaceAll('&quot;', '''"''').replaceAll(
                '''"{''', '''{''').replaceAll('''}"''', '''}'''));
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
  Future<DataState<List<List<CarAttributeModel>>>> getAllCars() async {
    try {
      final res = await getIt<ICarManagementLocalDataSource>().getAllCars();
      return DataSuccess(res);
    } catch (e) {
      return DataError(e.toString());
    }
  }
}
