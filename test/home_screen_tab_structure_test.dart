import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/home_screen_tab_structure.dart';

void main() {
  testWidgets('Tabs should change and display widgets accordingly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    expect(find.byType(TabBar), findsOneWidget);

    expect(find.text('Latest Schedules'), findsOneWidget);
    expect(find.text('Latest Requests'), findsOneWidget);

    expect(find.byType(TabBarView), findsOneWidget);

    expect(find.text('Schedule Tile'), findsOneWidget);
    expect(find.text('Requests Tile'), findsNothing);

    expect(find.text('Offer a Ride'), findsOneWidget);
    expect(find.text('Get a Ride'), findsOneWidget);

    await tester.tap(find.byType(TabBar));
    await tester.pumpAndSettle();

    expect(find.text('Schedule Tile'), findsNothing);
    expect(find.text('Requests Tile'), findsOneWidget);

    expect(find.text('Offer a Ride'), findsOneWidget);
    expect(find.text('Get a Ride'), findsOneWidget);
  });
}
