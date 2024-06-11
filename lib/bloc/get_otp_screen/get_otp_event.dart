// otp_event.dart
import 'package:equatable/equatable.dart';

abstract class OTPEvent extends Equatable {
  const OTPEvent();

  @override
  List<Object> get props => [];
}

class VerifyPhoneNumber extends OTPEvent {
  final String phoneNumber;
  final String? username;

  const VerifyPhoneNumber({required this.phoneNumber, required this.username});
}

class CheckUsernameAvailability extends OTPEvent {
  final String username;

  const CheckUsernameAvailability({required this.username});
}
