import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/view_requests_screen.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

void main() {
  testWidgets('Schedule Screen shown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ViewRequestsScreen(),
      ),
    );
    expect(find.text('RIDE BHAIYA'), findsOneWidget);
    expect(find.text('View Schedules'), findsWidgets);

    expect(find.byType(ScheduleOneTile), findsOneWidget);
    expect(find.byType(ScheduleTwoTile), findsOneWidget);
    expect(find.byType(RideDetailsTile), findsNWidgets(2));
  });
}