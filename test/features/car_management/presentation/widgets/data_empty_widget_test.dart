import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/data_empty_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; 

class MockFunction extends Mock {
  void call();
}

void main() {
  group('DataEmptyWidget tests', () {
    late MockFunction mockOnCreate;

    setUp(() {
      mockOnCreate = MockFunction();
    });

    testWidgets('renders correctly with text and button', (WidgetTester tester) async {
      // Build the widget inside a responsive context using ResponsiveSizer.
      await tester.pumpWidget(
        ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              home: Scaffold(
                body: DataEmptyWidget(onCreate: mockOnCreate),
              ),
            );
          },
        ),
      );
      // Check if the text 'تاکنون خودرویی ثبت نکرده اید' is rendered.
      expect(find.text('تاکنون خودرویی ثبت نکرده اید'), findsOneWidget);

      // Check if the button with 'ثبت خودرو' is rendered.
      expect(find.text('ثبت خودرو'), findsOneWidget);
    });

    testWidgets('triggers onCreate callback when button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(
        ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              home: Scaffold(
                body: DataEmptyWidget(onCreate: mockOnCreate),
              ),
            );
          },
        ),
      );

      // Simulate button press.
      await tester.tap(find.text('ثبت خودرو'));

      // Rebuild the widget after the state has changed.
      await tester.pump();

      // Verify the `onCreate` function is called once.
      verify(mockOnCreate.call()).called(1);
    });
  });
}