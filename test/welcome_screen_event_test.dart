// test/bloc/welcome_screen/welcome_screen_event_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_event.dart';

void main() {
  group('WelcomeScreenEvent', () {
    test('NavigateToSignUp props are correct', () {
      expect(NavigateToSignUp().props, []);
    });

    test('NavigateToLogin props are correct', () {
      expect(NavigateToLogin().props, []);
    });
  });
}
