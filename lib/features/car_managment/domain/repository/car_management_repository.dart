import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/form_fields_response_model.dart';

abstract class ICarManagementRepository {
  Future<DataState<FormFieldsResponseModel>> getFormFields();
}
