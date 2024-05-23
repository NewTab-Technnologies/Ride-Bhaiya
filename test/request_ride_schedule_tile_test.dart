import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

void main() {
  testWidgets('TileTwoButtons widget test', (WidgetTester tester) async {
    final List<String> values = [
      "Venkat Sai",
      "Dayton",
      "Denver Airport",
      "24th April 2024",
      "4:00 AM",
      "2",
      "(+1) 7203000803"
    ];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TileTwoButtons(values: values),
      ),
    ));

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

    expect(find.byKey(const Key('contactButton')), findsOneWidget);
    expect(find.byKey(const Key('viewMoreButton')), findsOneWidget);
  });
}
