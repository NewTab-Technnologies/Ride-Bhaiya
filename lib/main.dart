import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/splash_screen.dart';
import 'package:ridebhaiya/screens/view_requests_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RideBhaiya',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF49B6F3)),
        useMaterial3: true,
      ),
      home:
          const ViewRequestsScreen(), // when you change this class name in local, you need to revert it back to SplashScreen() before pushing to GitHub
    );
  }
}
