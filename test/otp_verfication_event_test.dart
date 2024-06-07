import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/otp_verification_screen/otp_verification_event.dart';

void main() {
  group('SubmitOTP', () {
    test('props should contain otp', () {
      final submitOTP = SubmitOTP('123456');
      expect(submitOTP.props, [submitOTP.otp]);
    });

    test('toString should contain otp', () {
      final submitOTP = SubmitOTP('123456');
      expect(submitOTP.toString().contains('123456'), true);
    });
  });
}
