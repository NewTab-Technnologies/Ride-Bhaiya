import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/otp_verification_screen.dart';

void main() {
  testWidgets('OTP Verification Screen test', (WidgetTester tester) async {
    // Build the OTPVerificationScreen widget.
    await tester.pumpWidget(MaterialApp(home: OTPVerificationScreen()));

    // Verify the presence of the AppBar title.
    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    // Verify the presence of the OTP Verification text.
    expect(find.text('OTP\nVerification'), findsOneWidget);

    // Verify the presence of the TextFormField for entering OTP.
    expect(find.byType(TextFormField), findsOneWidget);

    // Enter text into the OTP field.
    await tester.enterText(find.byType(TextFormField), '123456');
    await tester.pump();

    // Verify that the entered text is correct.
    expect(find.text('123456'), findsOneWidget);

    // Verify the presence of the 'Verify' button.
    expect(find.text('Verify'), findsOneWidget);

    // Tap the 'Verify' button.
    await tester.tap(find.text('Verify'));
    await tester.pump();
    
    // Add more assertions if necessary, for example, verifying navigation or error messages.
  });
}
