import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/home_screen_tab_structure.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

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

    expect(find.byType(TabBarView), findsOneWidget);

    expect(find.byType(TileTwoButtons), findsOneWidget);

    expect(find.text('Offer a Ride'), findsOneWidget);
    expect(find.text('Get a Ride'), findsOneWidget);

    await tester.tap(find.byType(TabBar));
    await tester.pumpAndSettle();

    expect(find.byType(TileTwoButtons), findsOneWidget);

    expect(find.text('Offer a Ride'), findsOneWidget);
    expect(find.text('Get a Ride'), findsOneWidget);
  });
}
