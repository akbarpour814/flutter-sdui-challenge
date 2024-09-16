import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/options_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/props_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/form_generator_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/field_model.dart';

import '../../../../mocked/mocked_data_test.dart';

void main() {
  group('FormGeneratorWidget Tests', () {
    late FormFieldsResponseModel formFields;

    setUp(() {
      formFields = FormFieldsResponseModel(fields: [
        FieldModel(type: 'input', label: 'Input Field'),
        FieldModel(type: 'textarea', label: 'Textarea Field'),
        FieldModel(
          type: 'select',
          label: 'Dropdown Field',
          props: PropsModel(options: [
            OptionsModel(label: 'Option 1', value: '1'),
            OptionsModel(label: 'Option 2', value: '2'),
          ]),
        ),
        FieldModel(type: 'file', label: 'File Input Field'),
      ]);
    });

    testWidgets('renders all field types correctly', (WidgetTester tester) async {
      disableOverflowErrors();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FormGeneratorWidget(formFields: formFields),
          ),
        ),
      );

      // Check for the 'input' field rendered by TextFieldGenerator
      expect(find.text('Input Field'), findsOneWidget);

      // Check for the 'textarea' field rendered by TextFieldGenerator
      expect(find.text('Textarea Field'), findsOneWidget);

      // Check for the 'select' field rendered by DropDownGenerator
      expect(find.text('Dropdown Field'), findsOneWidget);

      // Check for the 'file' field rendered by ImagePickerGenerator
      expect(find.text('File Input Field'), findsOneWidget);
    });

    testWidgets('handles missing or unsupported field types gracefully', (WidgetTester tester) async {
      disableOverflowErrors();
      formFields = FormFieldsResponseModel(fields: [
        FieldModel(type: 'unsupported', label: 'Unsupported Field'),
        FieldModel(type: null, label: 'Missing Type Field'),
      ]);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FormGeneratorWidget(formFields: formFields),
          ),
        ),
      );

      // Unsupported and null types should not display anything
      expect(find.text('Unsupported Field'), findsNothing);
      expect(find.text('Missing Type Field'), findsNothing);
    });

  });
}