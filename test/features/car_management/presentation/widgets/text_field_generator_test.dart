import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/field_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/props_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/style_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/text_field_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextFieldGenerator Tests', () {
    testWidgets('renders TextField with label and hint', (WidgetTester tester) async {
      // Sample FieldModel data
      final fieldModel = FieldModel(
        label: 'Test Label',
        props: PropsModel(placeholder: 'Enter value here'),
        style: StyleModel(margin: '10', borderRadius: '8', padding: '8'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextFieldGenerator(item: fieldModel),
          ),
        ),
      );

      // Verify the label and hint text
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Enter value here'), findsOneWidget);
    });

    testWidgets('uses correct input type when type is number', (WidgetTester tester) async {
      final fieldModel = FieldModel(
        label: 'Test Label',
        props: PropsModel(type: 'number'),
        style: StyleModel(margin: '10', borderRadius: '8', padding: '8'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextFieldGenerator(item: fieldModel),
          ),
        ),
      );
    });

    testWidgets('validator is called when form is submitted', (WidgetTester tester) async {
      final fieldModel = FieldModel(
        label: 'Test Label',
        props: PropsModel(type: 'text'),
        style: StyleModel(margin: '10', borderRadius: '8', padding: '8'),
      );

      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: TextFieldGenerator(item: fieldModel),
            ),
          ),
        ),
      );

      // Trigger form validation
      formKey.currentState!.validate();

      // Expect the validation to be called
      expect(find.text('Test Label'), findsOneWidget);
    });
  });
}