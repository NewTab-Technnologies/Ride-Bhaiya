import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/otp_verification_screen/otp_verification_state.dart';

void main() {
  group('OTPVerificationState', () {
    test('VerInitial props', () {
      final state = VerInitial();
      expect(state.props, []);
    });

    test('OTPTimerStarted props', () {
      const start = 30;
      const state = OTPTimerStarted(start);

      expect(state.props, [start]);
    });

    test('OTPVerified props', () {
      final state = OTPVerified();
      expect(state.props, []);
    });

    test('OTPVerificationFail props', () {
      const error = 'Error message';
      const state = OTPVerificationFail(error);

      expect(state.props, [error]);
    });

    test('OTPResent props', () {
      final state = OTPResent();
      expect(state.props, []);
    });

    test('OTPResendFailed props', () {
      const error = 'Error message';
      const state = OTPResendFailed(error);

      expect(state.props, [error]);
    });
  });
}
