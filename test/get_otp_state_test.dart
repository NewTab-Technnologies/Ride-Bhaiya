import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_state.dart';

void main() {
  group('OTPState', () {
    group('OTPInitial', () {
      test('supports value comparisons', () {
        expect(OTPInitial(), OTPInitial());
      });
    });

    group('OTPLoading', () {
      test('supports value comparisons', () {
        expect(OTPLoading(), OTPLoading());
      });
    });

    group('OTPPhoneVerified', () {
      test('props are [verificationId]', () {
        const verificationId = 'verification123';
        const state = OTPPhoneVerified(verificationId: verificationId);

        expect(state.props, [verificationId]);
      });

      test('supports value comparisons', () {
        const stateA = OTPPhoneVerified(verificationId: 'verification123');
        const stateB = OTPPhoneVerified(verificationId: 'verification123');

        expect(stateA, stateB);
      });
    });

    group('OTPVerificationFailed', () {
      test('props are [error]', () {
        const error = 'error message';
        const state = OTPVerificationFailed(error: error);

        expect(state.props, [error]);
      });

      test('supports value comparisons', () {
        const stateA = OTPVerificationFailed(error: 'error message');
        const stateB = OTPVerificationFailed(error: 'error message');

        expect(stateA, stateB);
      });
    });

    group('UsernameAvailabilityChecked', () {
      test('props are [isTaken]', () {
        const isTaken = true;
        const state = UsernameAvailabilityChecked(isTaken: isTaken);

        expect(state.props, [isTaken]);
      });

      test('supports value comparisons', () {
        const stateA = UsernameAvailabilityChecked(isTaken: true);
        const stateB = UsernameAvailabilityChecked(isTaken: true);

        expect(stateA, stateB);
      });
    });
  });
}
