import 'package:flutter/material.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';
import 'package:ridebhaiya/screens/success.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: '               Enter OTP',
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
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SuccessScreen()),
                (Route<dynamic> route) => false,
              ),
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
          ],
        ),
      ),
    );
  }
}
