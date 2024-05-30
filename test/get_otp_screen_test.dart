import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/get_otp_screen.dart';
import 'package:ridebhaiya/screens/otp_verification_screen.dart';

void main() {
  testWidgets('GetOTPScreen UI Test', (WidgetTester tester) async {
    // Build the GetOTPScreen widget with default 'login' page.
    await tester.pumpWidget(const MaterialApp(home: GetOTPScreen()));

    // Check for the RIDE BHAIYA text in the AppBar.
    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    // Check for the OTP Verification text when the page is 'login'.
    expect(find.text('OTP \nVerification'), findsOneWidget);

    // Check for the TextFormField for mobile number.
    expect(find.byType(TextFormField), findsOneWidget);

    // Check for the +91 prefix text.
    expect(find.text('+91'), findsOneWidget);

    // Check for the Get OTP button.
    final getOtpButtonFinder = find.text('Get OTP');
    expect(getOtpButtonFinder, findsOneWidget);

    // Ensure the Get OTP button is visible.
    await tester.ensureVisible(getOtpButtonFinder);
    await tester.pumpAndSettle();

    // Tap the Get OTP button and wait for navigation.
    await tester.tap(getOtpButtonFinder);
    await tester.pumpAndSettle();

    // Check if the OTPVerificationScreen is displayed after tapping the button.
    expect(find.byType(OTPVerificationScreen), findsOneWidget);
  });

  testWidgets('GetOTPScreen UI Test for sign up page',
      (WidgetTester tester) async {
    // Build the GetOTPScreen widget with 'signup' page.
    await tester
        .pumpWidget(const MaterialApp(home: GetOTPScreen(page: 'signup')));

    // Check for the RIDE BHAIYA text in the AppBar.
    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    // Check for the Enter your Details text when the page is 'signup'.
    expect(find.text('Enter your \nDetails'), findsOneWidget);

    // Check for both TextFormFields (username and mobile number).
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Check for the Get OTP button.
    final getOtpButtonFinder = find.text('Get OTP');
    expect(getOtpButtonFinder, findsOneWidget);

    // Ensure the Get OTP button is visible.
    await tester.ensureVisible(getOtpButtonFinder);
    await tester.pumpAndSettle();

    // Tap the Get OTP button and wait for navigation.
    await tester.tap(getOtpButtonFinder);
    await tester.pumpAndSettle();

    // Check if the OTPVerificationScreen is displayed after tapping the button.
    expect(find.byType(OTPVerificationScreen), findsOneWidget);
  });
}
