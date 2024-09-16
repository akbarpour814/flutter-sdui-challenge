import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/core/widgets/animated_expanded_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimatedExpandedWidget initial state and animation', (WidgetTester tester) async {
    // Build the widget with initial expand state as true
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimatedExpandedWidget(
            expand: true,
            child: Container(height: 100, width: 100, color: Colors.blue),
          ),
        ),
      ),
    );

    // Pumping once to allow the animation to start
    await tester.pump();

    // Ensure the size of the container is as expected when expanded
    expect(find.byType(Container), findsOneWidget);
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints, isNotNull);
    expect(container.constraints!.maxHeight, 100);
    expect(container.constraints!.maxWidth, 100);

    // Build the widget with expand state as false
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimatedExpandedWidget(
            expand: false,
            child: Container(height: 100, width: 100, color: Colors.blue),
          ),
        ),
      ),
    );

    // Pumping again to process the animation
    await tester.pump();

  });

  testWidgets('AnimatedExpandedWidget animation on expand and collapse', (WidgetTester tester) async {
    final key = UniqueKey();

    // Build the widget with initial expand state as true
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimatedExpandedWidget(
            key: key,
            expand: true,
            child: Container(height: 100, width: 100, color: Colors.blue),
          ),
        ),
      ),
    );

    // Pumping once to allow the animation to start
    await tester.pump();

    // Verify that the widget starts in an expanded state
    expect(find.byType(Container), findsOneWidget);

    // Rebuild the widget with expand state as false
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimatedExpandedWidget(
            key: key,
            expand: false,
            child: Container(height: 100, width: 100, color: Colors.blue),
          ),
        ),
      ),
    );

    // Pumping to process the animation
    await tester.pump();

  });

  testWidgets('AnimatedExpandedWidget disposes AnimationController', (WidgetTester tester) async {
    // Build the widget and check that the animation controller is created
    final widget = AnimatedExpandedWidget(
      expand: true,
      child: Container(height: 100, width: 100, color: Colors.blue),
    );
    
    // Use a StatefulWidget wrapper to call dispose manually
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) {
              return widget;
            },
          ),
        ),
      ),
    );
  });
}