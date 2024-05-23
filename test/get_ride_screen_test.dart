import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/get_ride_screen.dart';

void main() {
  testWidgets('Ridebhaiya widget test', (WidgetTester tester) async {
// Build the Ridebhaiya widget
    await tester.pumpWidget(
      const MaterialApp(home: GetRideScreen()),
    );

// Verify if the AppBar title is displayed
    expect(find.text('RIDE BHAIYA'), findsOneWidget);

// Verify if the image is displayed
    expect(find.byType(Image), findsOneWidget);

// Verify if the "View Schedules" button is displayed
    expect(find.text('View Schedules'), findsOneWidget);
    expect(find.byIcon(Icons.access_time_rounded), findsOneWidget);

// Verify if the "Request a Ride" button is displayed
    expect(find.text('Request a Ride'), findsOneWidget);
    expect(find.byIcon(Icons.calendar_month_sharp), findsOneWidget);

    expect(find.text('Request a Ride'), findsOneWidget);
  });
}
