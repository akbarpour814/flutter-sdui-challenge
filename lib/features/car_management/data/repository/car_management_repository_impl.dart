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
      // Step 1: Extract the JSON-like part of the response using regex.
      const String pattern =
          r'"fields":.*?\}\]}'; // Regex pattern to extract the fields object
      final RegExp regex = RegExp(pattern);
      final Match? match = regex.firstMatch(res.data);

      if (match == null) {
        throw const FormatException(
            'Could not extract valid JSON from the response.');
      }

      // Step 2: Clean up the extracted string, replacing HTML entities with proper characters.
      String extractedJson = match
          .group(0)!
          .replaceAll('&quot;', '"') // Convert &quot; to "
          .replaceAll('"{', '{') // Fix any wrapping quotes around object start
          .replaceAll('}"', '}'); // Fix any wrapping quotes around object end

      // Step 3: Parse the cleaned JSON string.
      return jsonDecode('{"fields": $extractedJson}');
    } catch (e) {
      // Handle parsing errors or other issues gracefully.
      print('Error parsing JSON: $e');
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
