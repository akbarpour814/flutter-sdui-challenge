
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';

void main() {
  group('FormFieldsResponseModel Model Test', () {
    test('toJson and fromJson', () {
      final formfieldsresponsemodel = FormFieldsResponseModel(
        
      );
      
      formfieldsresponsemodel.toJson();
      FormFieldsResponseModel.fromJson({"test": "test"});
    });
  });
}
