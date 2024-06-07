import 'package:test/test.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_event.dart';

void main() {
  group('GetOTPEvent', () {
    test('props should be empty for SubmitMobileNumber', () {
      expect(const SubmitMobileNumber().props, []);
    });

    test('props should contain userName for SubmitUserName', () {
      const userName = 'test_user';
      expect(const SubmitUserName(userName).props, [userName]);
    });

    test('SubmitMobileNumber instances with the same props should be equal',
        () {
      const submitMobileNumber1 = SubmitMobileNumber();
      const submitMobileNumber2 = SubmitMobileNumber();
      expect(submitMobileNumber1, submitMobileNumber2);
    });

    test('SubmitUserName instances with the same props should be equal', () {
      const userName = 'test_user';
      const submitUserName1 = SubmitUserName(userName);
      const submitUserName2 = SubmitUserName(userName);
      expect(submitUserName1, submitUserName2);
    });

    test('SubmitUserName instances with different props should not be equal',
        () {
      const submitUserName1 = SubmitUserName('user1');
      const submitUserName2 = SubmitUserName('user2');
      expect(submitUserName1, isNot(submitUserName2));
    });
  });
}
