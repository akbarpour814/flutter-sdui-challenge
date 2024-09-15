import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/screens/add_car_screen.dart';

void main() {
  testWidgets('AddCarScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AddCarScreen(onAdded: () {}),
    ));
  });
}
