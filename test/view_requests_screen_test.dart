import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/view_requests_screen.dart'; // Adjust the import path if necessary

void main() {
  testWidgets('AppBar Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ViewRequestsScreen()));

    // Check for the presence of the AppBar
    final appBarFinder = find.byKey(const Key('app_bar'));
    expect(appBarFinder, findsOneWidget);

    // Check the title of the AppBar
    expect(find.text('RIDE BHAIYA'), findsOneWidget);
  });

  testWidgets('Text Styling Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ViewRequestsScreen()));

    // Check for the presence of the specific text
    expect(find.text('View Requests'), findsOneWidget);
  });

  testWidgets('Container Decoration Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ViewRequestsScreen()));

    // Find all Container widgets
    final containers = find.byType(Container);
    expect(containers, findsNWidgets(2)); // Adjust the number based on your UI

    // Check the decoration of the first container
    final firstContainer = tester.widget<Container>(containers.first);
    final BoxDecoration decoration = firstContainer.decoration as BoxDecoration;
    expect(decoration.color, equals(Colors.white));
    expect(decoration.borderRadius, equals(BorderRadius.circular(35.0)));
  });

  testWidgets('Spacing Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ViewRequestsScreen()));

    // Find all SizedBox widgets
    final sizedBoxes = find.byType(SizedBox);
    expect(sizedBoxes, findsNWidgets(3)); // Adjust the number based on your UI

    // Check the height of the first SizedBox
    final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
    expect(firstSizedBox.height,
        equals(20.0)); // Ensure this matches your UI design
  });
}
