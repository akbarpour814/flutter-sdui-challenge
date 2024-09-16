import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/props_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/style_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/image_picker_generator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/field_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  group('ImagePickerGenerator widget tests', () {
    late FieldModel fieldModel;
    late MockImagePicker mockImagePicker;
    late ScrollController scrollController;

    setUp(() {
      mockImagePicker = MockImagePicker();
      scrollController = ScrollController();
      fieldModel = FieldModel(
        label: 'Upload Image',
        props: PropsModel(multiple: false),
        style:
            StyleModel(margin: '10px 0', borderRadius: '8px', padding: '8px'),
      )..selectedFiles = [];
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ImagePickerGenerator(
                item: fieldModel, scrollController: scrollController),
          ),
        ),
      );

      // Check if the upload button is displayed
      expect(find.text('Upload Image'), findsOneWidget);
      expect(find.byIcon(Icons.add_photo_alternate_outlined), findsOneWidget);
    });

    testWidgets('single image selection displays image',
        (WidgetTester tester) async {
      final xfile = XFile('test_image.jpg');
      when(mockImagePicker.pickImage(source: anyNamed('source')))
          .thenAnswer((_) async => xfile);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ImagePickerGenerator(
                item: fieldModel, scrollController: scrollController),
          ),
        ),
      );

      // Tap on the image picker button
      await tester.tap(find.text('Upload Image'));
      await tester.pumpAndSettle();
    });

    testWidgets('multiple image selection displays all images',
        (WidgetTester tester) async {
      fieldModel = FieldModel(
        label: 'Upload Image',
        props: PropsModel(multiple: true),
        style:
            StyleModel(margin: '10px 0', borderRadius: '8px', padding: '8px'),
      )..selectedFiles = [];

      final xfile1 = XFile('test_image_1.jpg');
      final xfile2 = XFile('test_image_2.jpg');
      when(mockImagePicker.pickMultiImage())
          .thenAnswer((_) async => [xfile1, xfile2]);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ImagePickerGenerator(
                item: fieldModel, scrollController: scrollController),
          ),
        ),
      );

      // Tap on the image picker button
      await tester.tap(find.text('Upload Image'));
      await tester.pumpAndSettle();
    });

    testWidgets('no image selected does not display any images',
        (WidgetTester tester) async {
      when(mockImagePicker.pickImage(source: anyNamed('source')))
          .thenAnswer((_) async => null);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ImagePickerGenerator(
                item: fieldModel, scrollController: scrollController),
          ),
        ),
      );

      // Tap on the image picker button
      await tester.tap(find.text('Upload Image'));
      await tester.pumpAndSettle();

      // No images should be displayed
      expect(find.byType(GridView), findsNothing);
    });

    testWidgets('image size validation highlights large image in red',
        (WidgetTester tester) async {
      final largeFile = XFile('large_image.jpg');
      when(mockImagePicker.pickImage(source: anyNamed('source')))
          .thenAnswer((_) async => largeFile);

      // Mock File size to be greater than 5MB
      final mockFile = MockFile();
      when(mockFile.lengthSync()).thenReturn(6 * 1024 * 1024); // 6MB

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ImagePickerGenerator(
                item: fieldModel, scrollController: scrollController),
          ),
        ),
      );

      // Tap on the image picker button
      await tester.tap(find.text('Upload Image'));
      await tester.pumpAndSettle();
    });
  });
}
