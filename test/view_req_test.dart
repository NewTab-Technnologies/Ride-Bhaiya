import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/pages/view_req.dart'; // Import your ViewRequestsScreen class

void main() {
  testWidgets('Widget Rendering Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ViewRequestsScreen()));
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('AppBar Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ViewRequestsScreen()));
    expect(find.text('RIDE BHAIYA'), findsOneWidget);
    expect(find.byKey(const Key('app_bar')), findsOneWidget);
  });

  testWidgets('Text Styling Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ViewRequestsScreen()));
    expect(find.text('View Requests'), findsOneWidget);
    expect(find.text('Requests'), findsNWidgets(2));
    // Add additional checks for text styling here
  });

  testWidgets('Container Decoration Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ViewRequestsScreen()));
    expect(find.byType(Container), findsNWidgets(2));
    // Add checks for container dimensions, color, border radius, etc.
  });

  testWidgets('Spacing Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ViewRequestsScreen()));
    expect(find.byType(SizedBox), findsNWidgets(3));
    // Add checks for spacing between widgets
  });

  // Add more test cases as needed for other aspects like widget hierarchy, interactions, state management, etc.
}
