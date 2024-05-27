// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/schedule_screen.dart';

void main() {
  testWidgets('ScheduleRideForm test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ScheduleRideScreen()));

    expect(find.text('RIDE BHAIYA'), findsOneWidget);
    expect(find.text('Schedule a Ride'), findsOneWidget);
    expect(find.text('Schedule'), findsOneWidget);
    expect(find.byIcon(Icons.access_time), findsWidgets);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });
}
