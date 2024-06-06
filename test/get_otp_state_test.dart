import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_state.dart';

void main() {
  group('GetOTPState', () {
    test('GetOTPInitial supports value comparison', () {
      expect(
        GetOTPInitial(),
        equals(GetOTPInitial()),
      );
    });

    test('GetOTPLoading supports value comparison', () {
      expect(
        GetOTPLoading(),
        equals(GetOTPLoading()),
      );
    });

    test('GetOTPSuccess supports value comparison', () {
      expect(
        GetOTPSuccess(),
        equals(GetOTPSuccess()),
      );
    });

    test('GetOTPError supports value comparison', () {
      const message = 'An error occurred';
      expect(
        const GetOTPError(message),
        equals(const GetOTPError(message)),
      );
    });

    test('GetOTPError has correct props', () {
      const message = 'An error occurred';
      expect(
        const GetOTPError(message).props,
        equals([message]),
      );
    });
  });
}
