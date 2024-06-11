import 'package:equatable/equatable.dart';

abstract class OTPVerificationEvent extends Equatable {
  const OTPVerificationEvent();

  @override
  List<Object> get props => [];
}

class StartTimer extends OTPVerificationEvent {}

class VerifyOTP extends OTPVerificationEvent {
  final String otp;
  final String? username;
  const VerifyOTP(this.otp, this.username);

  @override
  List<Object> get props => [otp];
}

class ResendOTP extends OTPVerificationEvent {}
