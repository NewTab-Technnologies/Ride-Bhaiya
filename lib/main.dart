import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          const SplashScreen(), // when you change this class name in local, you need to revert it back to SplashScreen() before pushing to GitHub
    );
  }
}
