import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/screens/splash_screen.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeScreenBloc>(
          create: (context) => WelcomeScreenBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'RideBhaiya',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF49B6F3)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
