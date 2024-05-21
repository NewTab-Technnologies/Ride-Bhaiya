import 'package:ridebhaiya/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WelcomeScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));

    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    expect(find.text('Sign Up'), findsOneWidget);

    expect(find.text('Login'), findsOneWidget);

    await tester.tap(find.text('Sign Up'));
    await tester.pump();

    await tester.tap(find.text('Login'));
    await tester.pump();
  });
}
