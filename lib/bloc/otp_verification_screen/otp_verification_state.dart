import 'package:equatable/equatable.dart';

abstract class OTPVerificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class OTPVerificationInitial extends OTPVerificationState {}

class OTPVerificationLoading extends OTPVerificationState {}

class OTPVerificationSuccess extends OTPVerificationState {}

class OTPVerificationError extends OTPVerificationState {
  final String message;

  OTPVerificationError(this.message);

  @override
  List<Object> get props => [message];
}
