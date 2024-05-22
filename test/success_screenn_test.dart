import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:ridebhaiya/screens/success.dart';

void main() {
  testWidgets('success_Screen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SuccessScreen(),
    ));

    expect(find.text('Congratulations'), findsOneWidget);
    final iconFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is Iconify && widget.icon == La.hand_peace_solid,
    );

    expect(iconFinder, findsOneWidget);

    expect(find.text('Successfully Verified'), findsOneWidget);
  });
}
