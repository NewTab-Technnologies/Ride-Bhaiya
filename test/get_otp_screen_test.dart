import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:ridebhaiya/main.dart';
import 'package:ridebhaiya/screens/get_otp_screen.dart';

void main() {
  testWidgets('GetOTPScreen UI Test', (WidgetTester tester) async {
    // Build the GetOTPScreen widget.
    await tester.pumpWidget(const MaterialApp(home: GetOTPScreen()));

    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    expect(find.text('OTP \nVerification'), findsOneWidget);

    expect(find.byType(TextFormField), findsOneWidget);

    expect(find.text('+91'), findsOneWidget);

    expect(find.text('Get OTP'), findsOneWidget);

    await tester.tap(find.text('Get OTP'));
    await tester.pumpAndSettle();

    expect(find.text('RIDE BHAIYA'), findsOneWidget);
  });
}
