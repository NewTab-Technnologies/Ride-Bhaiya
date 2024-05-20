import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

void main() {
  testWidgets('Schedule Tile shown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ScheduleTile(),
      ),
    );
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('From'), findsOneWidget);
    expect(find.text('To'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Time'), findsOneWidget);
    expect(find.text('Seats'), findsOneWidget);
    expect(find.text('Contact'), findsWidgets);
    expect(find.text('Venkat Sai'), findsOneWidget);
    expect(find.text('Dayton'), findsOneWidget);
    expect(find.text('Denver Airport'), findsOneWidget);
    expect(find.text('24th April 2024'), findsOneWidget);
    expect(find.text('4:00 AM'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('(+1) 7203000803'), findsOneWidget);

    await tester.tap(find.byKey(const Key("contactButton")));
    await tester.tap(find.byKey(const Key("viewMoreButton")));
  });
}
