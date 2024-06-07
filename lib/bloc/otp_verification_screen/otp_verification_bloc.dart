import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_verification_event.dart';
import 'otp_verification_state.dart';

class OTPVerificationBloc
    extends Bloc<OTPVerificationEvent, OTPVerificationState> {
  OTPVerificationBloc() : super(OTPVerificationInitial());

  Stream<OTPVerificationState> mapEventToState(
      OTPVerificationEvent event) async* {
    if (event is SubmitOTP) {
      yield OTPVerificationLoading();
      try {
        await Future.delayed(
            const Duration(seconds: 1)); // Simulate network call
        if (event.otp == "123456") {
          // Simulated successful OTP
          yield OTPVerificationSuccess();
        } else {
          yield OTPVerificationError("Invalid OTP");
        }
      } catch (error) {
        yield OTPVerificationError(error.toString());
      }
    }
  }
}
