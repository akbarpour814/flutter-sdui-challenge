
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/props_model.dart';

void main() {
  group('PropsModel Model Test', () {
    test('toJson and fromJson', () {
      final propsmodel = PropsModel(
        color: "", placeholder: "", size: "", type: "", rows: 0, multiple: true, maxSize: ""
      );
      
      propsmodel.toJson();
      PropsModel.fromJson({"test": "test"});
    });
  });
}
