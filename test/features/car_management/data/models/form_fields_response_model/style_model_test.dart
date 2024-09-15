
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/style_model.dart';

void main() {
  group('StyleModel Model Test', () {
    test('toJson and fromJson', () {
      final stylemodel = StyleModel(
        borderRadius: "", margin: "", padding: ""
      );
      
      stylemodel.toJson();
      StyleModel.fromJson({"test": "test"});
    });
  });
}
