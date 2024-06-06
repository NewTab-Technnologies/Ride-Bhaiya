import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_otp_event.dart';
import 'get_otp_state.dart';

class GetOTPBloc extends Bloc<GetOTPEvent, GetOTPState> {
  GetOTPBloc() : super(GetOTPInitial());
  Stream<GetOTPState> mapEventToState(GetOTPEvent event) async* {
    if (event is SubmitMobileNumber) {
      yield GetOTPLoading();
      try {
        await Future.delayed(
            const Duration(seconds: 1)); // Simulate network call
        yield GetOTPSuccess();
      } catch (error) {
        yield GetOTPError(error.toString());
      }
    } else if (event is SubmitUserName) {
      yield GetOTPLoading();
      try {
        await Future.delayed(
            const Duration(seconds: 1)); // Simulate network call
        yield GetOTPSuccess();
      } catch (error) {
        yield GetOTPError(error.toString());
      }
    }
  }
}
