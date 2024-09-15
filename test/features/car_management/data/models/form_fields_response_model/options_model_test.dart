
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/options_model.dart';

void main() {
  group('OptionsModel Model Test', () {
    test('toJson and fromJson', () {
      final optionsmodel = OptionsModel(
        label: "", value: ""
      );
      
      optionsmodel.toJson();
      OptionsModel.fromJson({"test": "test"});
    });
  });
}
