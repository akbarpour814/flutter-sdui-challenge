import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';

abstract class ICarManagementRepository {
  /// get dynamic fields from remote source on github
  Future<DataState<FormFieldsResponseModel>> getFormFields();
  /// add new car to local hive data source
  Future<DataState> addNewCar(List<CarAttributeModel> request);
  /// delete a car from local hive data source
  Future<DataState> deleteCar(int id);
  /// get all cars from local hive data source
  Future<DataState<List<GetCarsResponseModel>>> getAllCars();
}
