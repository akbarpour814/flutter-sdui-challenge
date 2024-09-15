import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/props_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/style_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/field_model.dart';

void main() {
  group('FieldModel Model Test', () {
    test('toJson and fromJson', () {
      final fieldmodel = FieldModel(
          label: "",
          name: "",
          props: PropsModel(),
          style: StyleModel(),
          type: "");

      fieldmodel.toJson();
      FieldModel.fromJson({"test": "test"});
    });
  });
}
