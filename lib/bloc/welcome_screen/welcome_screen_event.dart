// lib/bloc/welcome_screen/welcome_screen_event.dart

import 'package:equatable/equatable.dart';

abstract class WelcomeScreenEvent extends Equatable {
  const WelcomeScreenEvent();

  @override
  List<Object?> get props => [];
}

class NavigateToSignUp extends WelcomeScreenEvent {}

class NavigateToLogin extends WelcomeScreenEvent {}
