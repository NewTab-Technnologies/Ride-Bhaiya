import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/screens/sign_up_screen.dart';
import 'package:ridebhaiya/screens/otp_verification_screen.dart';

void main() {
  testWidgets('SignUp UI Test', (WidgetTester tester) async {
    // Build the SignUp widget.
    await tester.pumpWidget(const MaterialApp(home: SignUp()));

    // Verify the presence of the title.
    expect(find.text('RIDE BHAIYA'), findsOneWidget);

    // Verify the presence of the subtitle.
    expect(find.text('Enter your \n Details'), findsOneWidget);

    // Verify the presence of two TextFormField widgets.
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify the presence of the mobile number prefix text.
    expect(find.text('+91'), findsOneWidget);

    // Verify the presence of the Get OTP button.
    expect(find.text('Get OTP'), findsOneWidget);

    // Ensure the Get OTP button is visible before tapping it.
    final getOtpButton = find.text('Get OTP');
    await tester.ensureVisible(getOtpButton);

    // Tap on the Get OTP button.
    await tester.tap(getOtpButton);
    await tester.pumpAndSettle();

    // Verify if it navigates to OTPVerificationScreen.
    // This could be done by checking for a unique widget or text present in OTPVerificationScreen.
    // Replace 'OTP Verification' with the actual text or widget present in OTPVerificationScreen.
    // Assuming the OTPVerificationScreen contains a Text widget with 'OTP Verification'.
    expect(find.byType(OTPVerificationScreen), findsOneWidget);
  });
}
