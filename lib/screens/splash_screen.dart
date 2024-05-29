import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      const Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
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
    return const Scaffold(
      backgroundColor: Color(0xFF49B6F3),
      body: Center(
        child: Text(
          'RB',
          style: TextStyle(
              fontSize: 133.0, color: Colors.white, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
