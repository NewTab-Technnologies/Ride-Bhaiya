import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/otp_verification_screen.dart';

class GetOTPScreen extends StatefulWidget {
  const GetOTPScreen({super.key, this.page = 'login'});
  final String page;

  @override
  State<GetOTPScreen> createState() => _GetOTPScreenState();
}

class _GetOTPScreenState extends State<GetOTPScreen> {
  late TextEditingController _mobileController;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController(); // Initialize here
  }

  @override
  void dispose() {
    _mobileController.dispose(); // Dispose here
    super.dispose();
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
                controller: _mobileController, // Assign controller here
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
                    child: Icon(
                      Icons.phone,
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
            ),
          ],
        ),
      ),
    );
  }
}
