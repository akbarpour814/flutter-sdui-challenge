import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/retry_btn.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('RetryBtn Tests', () {
    testWidgets('displays the error message', (WidgetTester tester) async {
      const String errorMessage = 'خطایی رخ داده است';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RetryBtn(
              errorMessage: errorMessage,
              onRetry: () {},
            ),
          ),
        ),
      );

      // Check that the error message is displayed
      expect(find.text(errorMessage), findsOneWidget);

      // Check that the "تلاش مجدد" button is present
      expect(find.text('تلاش مجدد'), findsOneWidget);
    });

    testWidgets('onRetry callback is called when retry button is pressed', (WidgetTester tester) async {
      final onRetryMock = MockOnRetry();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RetryBtn(
              errorMessage: 'خطایی رخ داده است',
              onRetry: onRetryMock.call,
            ),
          ),
        ),
      );

      // Tap the retry button
      await tester.tap(find.text('تلاش مجدد'));
      await tester.pump();

      // Verify that the onRetry callback was called
      verify(onRetryMock.call()).called(1);
    });
  });
}

// Mock class for onRetry callback
class MockOnRetry extends Mock {
  void call();
}