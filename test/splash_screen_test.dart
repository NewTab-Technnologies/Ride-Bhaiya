import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/splash_screen.dart';

// test this file by running the command:
// flutter test test/splash_screen_test.dart
void main() {
  testWidgets('SplashScreen should display RB text',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    expect(find.text('RB'), findsWidgets);
  });
}
