// test/bloc/welcome_screen/welcome_screen_state_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_state.dart';

void main() {
  group('WelcomeScreenState', () {
    test('WelcomeScreenInitial props are correct', () {
      expect(WelcomeScreenInitial().props, []);
    });

    test('NavigateToSignUpState props are correct', () {
      expect(NavigateToSignUpState().props, []);
    });

    test('NavigateToLoginState props are correct', () {
      expect(NavigateToLoginState().props, []);
    });
  });
}
