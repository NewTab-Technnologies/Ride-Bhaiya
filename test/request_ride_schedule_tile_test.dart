import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/models/schedule_model.dart';
import 'package:ridebhaiya/screens/home_screen_tab_structure.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

void main() {
  // Mock HomeScreen.number
  const String mockNumber = '1234567890';
  HomeScreen.number = mockNumber;

  testWidgets('RideDetailsTile displays ride details correctly',
      (WidgetTester tester) async {
    // Mock data for ScheduleModel
    final scheduleModel = ScheduleModel(
      destination: 'Destination A',
      requestedBy: 'User A',
      scheduleDates: DateTime.now(),
      scheduleTime: '10:00 AM',
      seatingFor: 4,
      startingPoint: 'Point A',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RideDetailsTile(
            values: scheduleModel,
            flag: true,
            path: 'one',
          ),
        ),
      ),
    );

    // Wait for all animations and frames to complete
    await tester.pumpAndSettle();

    // Verify if the ride details are displayed correctly
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('From'), findsOneWidget);
    expect(find.text('To'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Time'), findsOneWidget);
    expect(find.text('Seats'), findsOneWidget);
    expect(find.text('Contact'), findsWidgets);
    expect(find.text('User A'), findsOneWidget);
    expect(find.text('Point A'), findsOneWidget);
    expect(find.text('Destination A'), findsOneWidget);
    expect(find.text('10:00 AM'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text(mockNumber), findsOneWidget);

    expect(find.byKey(const Key('contactButton')), findsOneWidget);

    // Verify the presence of "View More" buttonne
    expect(find.byKey(const Key('viewMoreButton')), findsOneWidget);
  });
}
