import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sdui_challenge/core/utils/extentions.dart';

void main() {
  group('extensions', () {
    // Define a mock BuildContext
    testWidgets('w() returns correct width percentage', (WidgetTester tester) async {
      // Build a widget to provide a context
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          // Test the 'w' function
          double widthPercentage = 50.w(context); // 50% of the width
          double screenWidth = MediaQuery.of(context).size.width;
          
          expect(widthPercentage, screenWidth * 0.5);
          return Container();
        }),
      ));
    });

    testWidgets('h() returns correct height percentage', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          // Test the 'h' function
          double heightPercentage = 30.h(context); // 30% of the height
          double screenHeight = MediaQuery.of(context).size.height;
          
          expect(heightPercentage, screenHeight * 0.3);
          return Container();
        }),
      ));
    });

    testWidgets('wsb() creates SizedBox with correct width', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          // Test the 'wsb' function
          Widget widget = 100.wsb(child: Text('SizedBox Test'));
          expect(widget, isA<SizedBox>());
          
          final sizedBox = widget as SizedBox;
          expect(sizedBox.width, 100);
          return Container();
        }),
      ));
    });

    testWidgets('hsb() creates SizedBox with correct height', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          // Test the 'hsb' function
          Widget widget = 50.hsb(child: Text('SizedBox Test'));
          expect(widget, isA<SizedBox>());
          
          final sizedBox = widget as SizedBox;
          expect(sizedBox.height, 50);
          return Container();
        }),
      ));
    });

    testWidgets('whsb() creates SizedBox with correct width and height', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          // Test the 'whsb' function
          Widget widget = 30.whsb(child: Text('SizedBox Test'));
          expect(widget, isA<SizedBox>());
          
          final sizedBox = widget as SizedBox;
          expect(sizedBox.width, 30);
          expect(sizedBox.height, 30);
          return Container();
        }),
      ));
    });

    test('isNotNullOrEmpty returns false for null string', () {
      String? nullString;
      expect(nullString.isNotNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns false for empty string', () {
      String? emptyString = '';
      expect(emptyString.isNotNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns true for non-empty string', () {
      String? validString = 'Hello, World!';
      expect(validString.isNotNullOrEmpty, true);
    });

    test('isNotNullOrEmpty returns false for string literal "null"', () {
      String? nullLiteral = 'null';
      expect(nullLiteral.isNotNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns false for string literal "Null"', () {
      String? nullLiteral = 'Null';
      expect(nullLiteral.isNotNullOrEmpty, false);
    });
  });
}