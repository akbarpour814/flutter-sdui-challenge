import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/core/utils/use_case.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/domain/repository/car_management_repository.dart';

class GetFormFieldsUseCase
    extends TUseCase<DataState<FormFieldsResponseModel>> {
  @override
  Future<DataState<FormFieldsResponseModel>> call() =>
      getIt<ICarManagementRepository>().getFormFields();
}
