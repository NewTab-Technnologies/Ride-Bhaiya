import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/view_schedule_screen.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

void main() {
  testWidgets('Schedule Screen shown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ViewScheduleScreen(),
      ),
    );
    expect(find.text('RIDE BHAIYA'), findsOneWidget);
    expect(find.text('View Schedules'), findsWidgets);

    expect(find.byType(ScheduleTile), findsWidgets);
    expect(find.byType(RideDetailsTile), findsWidgets);
  });
}
