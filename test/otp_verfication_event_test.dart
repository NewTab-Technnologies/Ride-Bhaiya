import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/otp_verification_screen/otp_verification_event.dart';

void main() {
  group('OTPVerificationEvent', () {
    test('StartTimer props', () {
      final event = StartTimer();
      expect(event.props, []);
    });

    test('VerifyOTP props', () {
      const otp = '123456';
      const username = 'testuser';
      const event = VerifyOTP(otp, username);

      expect(event.props, [otp]);
    });

    test('VerifyOTP props with null username', () {
      const otp = '123456';
      const event = VerifyOTP(otp, null);

      expect(event.props, [otp]);
    });

    test('ResendOTP props', () {
      final event = ResendOTP();
      expect(event.props, []);
    });
  });
}
