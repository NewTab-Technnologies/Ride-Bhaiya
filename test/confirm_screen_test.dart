import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:ridebhaiya/screens/confirm.dart';

void main() {
  testWidgets('ConfirmScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ConfirmScreen(),
    ));

    expect(find.text('You did it'), findsOneWidget);

    final iconFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is Iconify && widget.icon == La.hand_peace_solid,
    );
    expect(iconFinder, findsOneWidget);

    expect(find.text('You successfully scheduled your ride'), findsOneWidget);

    expect(find.text('Have a safe journey'), findsOneWidget);
  });
}
