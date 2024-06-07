import 'package:equatable/equatable.dart';

abstract class OTPVerificationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitOTP extends OTPVerificationEvent {
  final String otp;

  SubmitOTP(this.otp);

  @override
  List<Object> get props => [otp];
}
