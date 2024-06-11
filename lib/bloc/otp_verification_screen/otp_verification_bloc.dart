import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:quiver/async.dart';
import 'package:ridebhaiya/screens/get_otp_screen.dart';
import 'otp_verification_event.dart';
import 'otp_verification_state.dart';

class OTPVerificationBloc
    extends Bloc<OTPVerificationEvent, OTPVerificationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _start = 30;
  // final bool  _resendButtonEnabled=false;
  // CountdownTimer? _countdownTimer;
  String? userphone;

  OTPVerificationBloc() : super(VerInitial()) {
    on<StartTimer>(_onStartTimer);
    on<VerifyOTP>(_onVerifyOTP);
    on<ResendOTP>(_onResendOTP);
  }

  void _onStartTimer(StartTimer event, Emitter<OTPVerificationState> emit) {
    _start = 30;

    emit(OTPTimerStarted(_start));
  }

  Future<void> _onVerifyOTP(
      VerifyOTP event, Emitter<OTPVerificationState> emit) async {
    if (event.otp.trim().isEmpty) {
      emit(const OTPVerificationFail('Please enter the OTP'));
      return;
    }

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId:
            GetOTPScreen.verify, // Assuming this is set somewhere in your code
        smsCode: event.otp.trim(),
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      emit(OTPVerified());
      if (user != null) {
        userphone = user.phoneNumber;
        Map<String, dynamic> userData = {
          'phone': user.phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
        };

        userData['username'] = event.username;

        await _firestore
            .collection('user')
            .doc(user.uid)
            .set(userData, SetOptions(merge: true));
      }
    } catch (e) {
      emit(OTPVerificationFail('OTP verification failed: ${e.toString()}'));
    }
  }

  Future<void> _onResendOTP(
      ResendOTP event, Emitter<OTPVerificationState> emit) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: userphone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          emit(OTPResendFailed(e.message!));
        },
        codeSent: (String verificationId, int? resendToken) {
          GetOTPScreen.verify = verificationId;
          emit(OTPResent());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      add(StartTimer());
    } catch (e) {
      emit(OTPResendFailed(e.toString()));
    }
  }
}
