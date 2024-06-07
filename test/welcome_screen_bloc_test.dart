// test/bloc/welcome_screen/welcome_screen_bloc_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_bloc.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_event.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_state.dart';

void main() {
  group('WelcomeScreenBloc', () {
    late WelcomeScreenBloc welcomeScreenBloc;

    setUp(() {
      welcomeScreenBloc = WelcomeScreenBloc();
    });

    tearDown(() {
      welcomeScreenBloc.close();
    });

    test('initial state is WelcomeScreenInitial', () {
      expect(welcomeScreenBloc.state, equals(WelcomeScreenInitial()));
    });

    blocTest<WelcomeScreenBloc, WelcomeScreenState>(
      'emits [NavigateToSignUpState] when NavigateToSignUp event is added',
      build: () => welcomeScreenBloc,
      act: (bloc) => bloc.add(NavigateToSignUp()),
      expect: () => [NavigateToSignUpState()],
    );

    blocTest<WelcomeScreenBloc, WelcomeScreenState>(
      'emits [NavigateToLoginState] when NavigateToLogin event is added',
      build: () => welcomeScreenBloc,
      act: (bloc) => bloc.add(NavigateToLogin()),
      expect: () => [NavigateToLoginState()],
    );
  });
}
