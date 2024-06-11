import 'package:equatable/equatable.dart';

abstract class OTPVerificationState extends Equatable {
  const OTPVerificationState();

  @override
  List<Object> get props => [];
}

class VerInitial extends OTPVerificationState {}

class OTPTimerStarted extends OTPVerificationState {
  final int start;

  const OTPTimerStarted(this.start);

  @override
  List<Object> get props => [start];
}

class OTPVerified extends OTPVerificationState {}

class OTPVerificationFail extends OTPVerificationState {
  final String error;

  const OTPVerificationFail(this.error);

  @override
  List<Object> get props => [error];
}

class OTPResent extends OTPVerificationState {}

class OTPResendFailed extends OTPVerificationState {
  final String error;

  const OTPResendFailed(this.error);

  @override
  List<Object> get props => [error];
}
