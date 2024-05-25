import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/view_schedule_screen.dart';
import 'package:ridebhaiya/widgets/view_request_schedule_tile.dart';

void main() {
  testWidgets('Schedule Screen shown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ScheduleScreen(),
      ),
    );
    expect(find.text('RIDE BHAIYA'), findsOneWidget);
    expect(find.text('View Schedules'), findsWidgets);

    expect(find.byType(ScheduleOneTile), findsOneWidget);
    expect(find.byType(ScheduleTwoTile), findsOneWidget);
    expect(find.byType(RequestScheduleTile), findsNWidgets(2));
  });
}
