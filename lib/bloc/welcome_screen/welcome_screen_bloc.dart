// lib/bloc/welcome_screen/welcome_screen_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_event.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_state.dart';

class WelcomeScreenBloc extends Bloc<WelcomeScreenEvent, WelcomeScreenState> {
  WelcomeScreenBloc() : super(WelcomeScreenInitial()) {
    on<NavigateToSignUp>((event, emit) {
      emit(NavigateToSignUpState());
    });
    on<NavigateToLogin>((event, emit) {
      emit(NavigateToLoginState());
    });
  }
}
