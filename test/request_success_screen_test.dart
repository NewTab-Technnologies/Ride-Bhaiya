import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:ridebhaiya/screens/request_success_screen.dart';

void main() {
  testWidgets('RequestSuccessScreen UI Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: RequestSuccessScreen(),
    ));

    // Verify that the 'Congratulations' text is displayed.
    expect(find.text('Congratulations'), findsOneWidget);

    // Verify that the Iconify widget with the specified icon is displayed.
    final iconFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is Iconify && widget.icon == La.hand_peace_solid,
    );
    expect(iconFinder, findsOneWidget);

    expect(find.text('Request Successful'), findsOneWidget);
  });
}
