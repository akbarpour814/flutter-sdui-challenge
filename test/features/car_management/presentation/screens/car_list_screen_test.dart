
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/screens/car_list_screen.dart';

void main() {
  testWidgets('CarListScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarListScreen(

      ),
    ));
    
  });
}
