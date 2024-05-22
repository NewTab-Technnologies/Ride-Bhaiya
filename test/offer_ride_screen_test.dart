import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/offer_ride_screen.dart'; // Adjust the import to your file structure

void main() {
  testWidgets('OfferRideScreen has a title and buttons',
      (WidgetTester tester) async {
    // Mock the image asset to prevent the error
    await tester.pumpWidget(
      const MaterialApp(
        home: OfferRideScreen(),
      ),
    );

    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Schedule a Ride'), findsOneWidget);
    expect(find.byIcon(Icons.access_time_sharp), findsOneWidget);

    expect(find.text('View Requests'), findsOneWidget);
    expect(find.byIcon(Icons.calendar_month_sharp), findsOneWidget);

    expect(find.text('View Requests'), findsOneWidget);
  });
}
