// otp_state.dart
import 'package:equatable/equatable.dart';

abstract class OTPState extends Equatable {
  const OTPState();

  @override
  List<Object?> get props => [];
}

class OTPInitial extends OTPState {}

class OTPLoading extends OTPState {}

class OTPPhoneVerified extends OTPState {
  final String verificationId;

  const OTPPhoneVerified({required this.verificationId});

  @override
  List<Object?> get props => [verificationId];
}

class OTPVerificationFailed extends OTPState {
  final String error;

  const OTPVerificationFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class UsernameAvailabilityChecked extends OTPState {
  final bool isTaken;

  const UsernameAvailabilityChecked({required this.isTaken});

  @override
  List<Object?> get props => [isTaken];
}
