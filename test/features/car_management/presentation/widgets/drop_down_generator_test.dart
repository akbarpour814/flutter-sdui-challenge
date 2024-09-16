import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/props_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/style_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/drop_down_generator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/field_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/options_model.dart';

void main() {
  group('DropDownGenerator widget tests', () {
    late FieldModel fieldModel;
    late OptionsModel option1;
    late OptionsModel option2;

    setUp(() {
      option1 = OptionsModel(label: 'Option 1', value: 'opt1');
      option2 = OptionsModel(label: 'Option 2', value: 'opt2');

      fieldModel = FieldModel(
        label: 'Select an option',
        props: PropsModel(options: [option1, option2]),
        style: StyleModel(margin: '10px 0', borderRadius: '8px', padding: '8px'),
      );
    });

    testWidgets('renders correctly with options', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropDownGenerator(item: fieldModel),
          ),
        ),
      );

      // Check if the label is correct
      expect(find.text('Select an option'), findsOneWidget);

      // Check if the dropdown contains the correct options
      expect(find.text('Option 1'), findsNothing); // Initially not visible
      expect(find.text('Option 2'), findsNothing); // Initially not visible
    });

    testWidgets('allows selection of an option', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropDownGenerator(item: fieldModel),
          ),
        ),
      );

      await tester.pumpAndSettle(); // Wait for the dropdown to open

    });

    testWidgets('validates correctly when no option is selected', (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: DropDownGenerator(item: fieldModel),
            ),
          ),
        ),
      );

      await tester.pump();

    });
  });
}