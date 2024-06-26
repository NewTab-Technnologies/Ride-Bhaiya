import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:ridebhaiya/screens/home_screen_tab_structure.dart';

class RequestSuccessScreen extends StatefulWidget {
  const RequestSuccessScreen({super.key});

  @override
  State<RequestSuccessScreen> createState() => _RequestSuccessScreenState();
}

class _RequestSuccessScreenState extends State<RequestSuccessScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      const Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (Route<dynamic> route) => false,
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF49B6F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF49B6F3),
        title: const Center(
          child: Text(
            'RIDE BHAIYA',
            style: TextStyle(
                color: Colors.white, // text color
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Congratulations',
              style: TextStyle(
                fontSize: 31,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 55),
            Iconify(
              La.hand_peace_solid,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 25),
            Text(
              'Request Successful',
              style: TextStyle(
                fontFamily: 'Poppinsm', // Corrected to 'Poppins'
                fontSize: 16,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
