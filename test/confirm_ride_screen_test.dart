import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:ridebhaiya/screens/confirm_ride.dart';

void main() {
  testWidgets('ConfirmRideScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ConfirmRideScreen(),
    ));

    expect(find.text('You did it'), findsOneWidget);
    final iconFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is Iconify && widget.icon == La.hand_peace_solid,
    );

    expect(iconFinder, findsOneWidget);

    expect(find.text('You successfully submitted your'), findsOneWidget);
    expect(find.text('ask for a ride'), findsOneWidget);
    expect(find.text('Have a safe ride and good day'), findsOneWidget);
  });
}
