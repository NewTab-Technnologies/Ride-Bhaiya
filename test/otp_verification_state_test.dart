import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/otp_verification_screen/otp_verification_state.dart';

void main() {
  group('OTPVerificationState', () {
    test('supports value comparisons', () {
      expect(OTPVerificationInitial(), OTPVerificationInitial());
      expect(OTPVerificationLoading(), OTPVerificationLoading());
      expect(OTPVerificationSuccess(), OTPVerificationSuccess());
      expect(OTPVerificationError('error'), OTPVerificationError('error'));

      expect(OTPVerificationInitial(), isNot(equals(OTPVerificationLoading())));
      expect(OTPVerificationInitial(), isNot(equals(OTPVerificationSuccess())));
      expect(OTPVerificationInitial(),
          isNot(equals(OTPVerificationError('error'))));

      expect(OTPVerificationLoading(), isNot(equals(OTPVerificationInitial())));
      expect(OTPVerificationLoading(), isNot(equals(OTPVerificationSuccess())));
      expect(OTPVerificationLoading(),
          isNot(equals(OTPVerificationError('error'))));

      expect(OTPVerificationSuccess(), isNot(equals(OTPVerificationInitial())));
      expect(OTPVerificationSuccess(), isNot(equals(OTPVerificationLoading())));
      expect(OTPVerificationSuccess(),
          isNot(equals(OTPVerificationError('error'))));

      expect(OTPVerificationError('error'),
          isNot(equals(OTPVerificationInitial())));
      expect(OTPVerificationError('error'),
          isNot(equals(OTPVerificationLoading())));
      expect(OTPVerificationError('error'),
          isNot(equals(OTPVerificationSuccess())));

      expect(OTPVerificationError('error'),
          isNot(equals(OTPVerificationError('different_error'))));
    });
  });
}
