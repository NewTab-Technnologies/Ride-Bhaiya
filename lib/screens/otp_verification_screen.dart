import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff49B6F3),
      appBar: AppBar(
        backgroundColor: Color(0xff49B6F3),
        title: const Center(
          child: Text(
            'RIDE BHAIYA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 190.0),
            Center(
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
            SizedBox(height: 95.0),
            Container(
              // padding: EdgeInsets.fromLTRB(0, 0, 0,55),
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    labelText: '               Enter OTP',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Poppinsm',
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Iconify(
                        Teenyicons.otp_solid,
                        color: Colors.white,
                        size: 33.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(65.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 4.3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(105.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 4.0,
                        ))),
                cursorColor: Colors.white,
              ),
            ),
            SizedBox(height: 38.0),
            GestureDetector(
              onTap: () => Navigator(),
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
            )
          ],
        ),
      ),
    );
  }
}
