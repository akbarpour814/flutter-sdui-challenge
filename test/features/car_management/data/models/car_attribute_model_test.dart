import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';

void main() {
  group('CarAttributeModel Model Test', () {
    test('genral test', () {
      CarAttributeModel(
          id: 0, attrName: "", attrLabel: "", attrValue: "", fileBytes: null);
    });
  });
}
