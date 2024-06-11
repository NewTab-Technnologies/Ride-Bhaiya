import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';
import 'package:ridebhaiya/screens/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ridebhaiya/screens/get_otp_screen.dart';
import 'package:quiver/async.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String? username;
  final String? verificationId;
  static String uid = '';

  const OTPVerificationScreen({
    required this.phoneNumber,
    this.username,
    this.verificationId,
    super.key,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _otpController = TextEditingController();
  int _start = 30;
  bool _resendButtonEnabled = false;
  CountdownTimer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _start = 30;
      _resendButtonEnabled = false;
    });
    _countdownTimer = CountdownTimer(
      Duration(seconds: _start),
      const Duration(seconds: 1),
    );

    _countdownTimer?.listen((data) {
      setState(() {
        _start -= 1;
      });
    }, onDone: () {
      setState(() {
        _resendButtonEnabled = true;
      });
      _countdownTimer?.cancel();
    });
  }

  Future<void> _verifyOTP() async {
    if (_otpController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the OTP')),
      );
      return;
    }

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: GetOTPScreen.verify,
        smsCode: _otpController.text.trim(),
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        OTPVerificationScreen.uid = user.uid;
        Map<String, dynamic> userData = {
          'phone': widget.phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
        };

        if (widget.username != null) {
          userData['username'] = widget.username;
        }

        await _firestore
            .collection('user')
            .doc(user.uid)
            .set(userData, SetOptions(merge: true));

        // Using a local context to avoid async gap issues
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()),
          (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP verification failed: ${e.toString()}')),
      );
    }
  }

  Future<void> _resendOTP() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('OTP resend failed: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          GetOTPScreen.verify = verificationId;
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP resent successfully')),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      startTimer();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP resend failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff49B6F3),
      appBar: AppBar(
        backgroundColor: const Color(0xff49B6F3),
        title: const Center(
          child: Text(
            'RIDE BHAIYA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 190.0),
            const Center(
              child: Text(
                'OTP\nVerification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 95.0),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Poppinsm',
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: Iconify(
                      Teenyicons.otp_solid,
                      color: Colors.white,
                      size: 33.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(65.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 4.3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(105.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    ),
                  ),
                ),
                cursorColor: Colors.white,
              ),
            ),
            const SizedBox(height: 38.0),
            GestureDetector(
              onTap: _verifyOTP,
              child: Container(
                height: 65.0,
                width: 220.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 21.0,
                      fontFamily: 'Poppinsm',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              _resendButtonEnabled
                  ? 'Didn\'t receive the OTP?'
                  : 'Resend OTP in $_start seconds',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'Poppinsm',
              ),
            ),
            TextButton(
              onPressed: _resendButtonEnabled ? _resendOTP : null,
              child: Text(
                'Resend OTP',
                style: TextStyle(
                  color: _resendButtonEnabled ? Colors.white : Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Poppinsm',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
