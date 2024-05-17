import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF49B6F3),
      body: Center(
        child: Text(
          'RB',
          style: TextStyle(fontSize: 133.0, color: Colors.white,fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}

