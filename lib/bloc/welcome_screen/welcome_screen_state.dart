// lib/bloc/welcome_screen/welcome_screen_state.dart

import 'package:equatable/equatable.dart';

abstract class WelcomeScreenState extends Equatable {
  const WelcomeScreenState();

  @override
  List<Object?> get props => [];
}

class WelcomeScreenInitial extends WelcomeScreenState {}

class NavigateToSignUpState extends WelcomeScreenState {}

class NavigateToLoginState extends WelcomeScreenState {}
