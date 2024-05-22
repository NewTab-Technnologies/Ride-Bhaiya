import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

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
                color: Colors.white,
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
              'You did it',
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
              'You successfully scheduled your ride',
              style: TextStyle(
                fontFamily: 'Poppinsm',
                fontSize: 16,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Have a safe journey',
              style: TextStyle(
                fontFamily: 'Poppinsm',
                fontSize: 16,
                letterSpacing: 1.0,
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
