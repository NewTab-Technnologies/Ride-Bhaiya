// otp_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_event.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_state.dart';
import 'package:ridebhaiya/screens/get_otp_screen.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  OTPBloc() : super(OTPInitial()) {
    on<VerifyPhoneNumber>(_onVerifyPhoneNumber);
    on<CheckUsernameAvailability>(_onCheckUsernameAvailability);
  }

  Future<void> _onVerifyPhoneNumber(
      VerifyPhoneNumber event, Emitter<OTPState> emit) async {
    emit(OTPLoading());

    final phoneNumber = '+91${event.phoneNumber.trim()}';
    String genOtp = "";
    if (event.username == null) {
      // Login
      final QuerySnapshot result = await _firestore
          .collection('user')
          .where('phone', isEqualTo: phoneNumber)
          .get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.isEmpty) {
        emit(
            const OTPVerificationFailed(error: 'Mobile Number Not Registered'));
        return;
      }
    } else {
      // Signup
      final QuerySnapshot phoneResult = await _firestore
          .collection('user')
          .where('phone', isEqualTo: phoneNumber)
          .get();
      final List<DocumentSnapshot> phoneDocuments = phoneResult.docs;

      if (phoneDocuments.isNotEmpty) {
        emit(const OTPVerificationFailed(
            error: 'Mobile Number Already Registered'));
        return;
      }

      final username = event.username!.trim();
      final bool isUsernameTaken = await _isUsernameTaken(username);
      if (isUsernameTaken) {
        emit(const OTPVerificationFailed(error: 'Username already exists'));
        return;
      }
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        emit(OTPVerificationFailed(
            error: e.message ?? 'Phone number verification failed'));
        if (e.code == 'too-many-requests') {
          emit(const OTPVerificationFailed(
              error: 'Too many requests. Please try again later.'));
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        GetOTPScreen.verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    emit(OTPPhoneVerified(verificationId: genOtp));
  }

  Future<void> _onCheckUsernameAvailability(
      CheckUsernameAvailability event, Emitter<OTPState> emit) async {
    final bool isTaken = await _isUsernameTaken(event.username);
    emit(UsernameAvailabilityChecked(isTaken: isTaken));
  }

  Future<bool> _isUsernameTaken(String username) async {
    final QuerySnapshot result = await _firestore
        .collection('user')
        .where('username', isEqualTo: username)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }
}
