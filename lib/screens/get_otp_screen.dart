import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/otp_verification_screen.dart';

class GetOTPScreen extends StatelessWidget {
  const GetOTPScreen({super.key});

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
                  fontFamily: 'Poppins'),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 180.0),
              const Center(
                  child: Text(
                'OTP \nVerification',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppinsm',
                    letterSpacing: 1.0),
              )),
              const SizedBox(height: 60.0),
              SizedBox(
                width: 360,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: '  Enter Your Mobile Number',
                      prefix: const Text(
                        '+91',
                        style: TextStyle(color: Colors.white),
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Poppinsm'),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child:
                            Icon(Icons.phone, color: Colors.white, size: 33.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(65.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 4.3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(65.0),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 4.0))),
                  cursorColor: Colors.white,
                ),
              ),
              const SizedBox(height: 45.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OTPVerificationScreen()),
                ),
                child: Container(
                  height: 60.0,
                  width: 215.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Center(
                    child: Text(
                      'Get OTP',
                      style: TextStyle(
                        color: Color(0xff49B6F3),
                        fontSize: 21.0,
                        fontFamily: 'Poppinsm',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
