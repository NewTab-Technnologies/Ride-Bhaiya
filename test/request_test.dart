// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/request_screen.dart';

void main() {
  testWidgets('RequestRideForm test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RequestRideScreen()));

    expect(find.text('RIDE BHAIYA'), findsOneWidget);
    expect(find.text('Request a Ride'), findsOneWidget);
    expect(find.text('Send Request'), findsOneWidget);
    expect(find.byIcon(Icons.help_outline_outlined), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });
}
