
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/car_item.dart';

void main() {
  testWidgets('CarItem renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CarItem(
          car: GetCarsResponseModel(data: [
            CarAttributeModel(
                id: 0,
                attrName: 'attrName',
                attrLabel: 'attrLabel',
                attrValue: 'attrValue',
                fileBytes: null),
           
          ], id: 0),
          onDeleteItem: () {}),
    ));
      expect(find.byType(Row), findsOneWidget);
  });
}
