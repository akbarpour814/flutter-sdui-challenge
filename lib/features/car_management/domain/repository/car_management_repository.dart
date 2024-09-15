import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';

abstract class ICarManagementRepository {
  Future<DataState<FormFieldsResponseModel>> getFormFields();
  Future<DataState> addNewCar(List<CarAttributeModel> request);
  Future<DataState> deleteCar(int id);
  Future<DataState<List<GetCarsResponseModel>>> getAllCars();
}
