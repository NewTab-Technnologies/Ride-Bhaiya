import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/screens/get_otp_screen.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_bloc.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_event.dart';
import 'package:ridebhaiya/bloc/welcome_screen/welcome_screen_state.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeScreenBloc, WelcomeScreenState>(
      listener: (context, state) {
        if (state is NavigateToSignUpState) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const GetOTPScreen(
                    key: ValueKey('signup'), page: 'signup')),
          );
        } else if (state is NavigateToLoginState) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const GetOTPScreen(key: ValueKey('login'), page: 'login')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff49B6F3),
        appBar: AppBar(
          title: const Text(
            'RIDE BHAIYA',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff49B6F3),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 250),
                ElevatedButton(
                  onPressed: () =>
                      context.read<WelcomeScreenBloc>().add(NavigateToSignUp()),
                  child: const Padding(
                    padding: EdgeInsets.all(9),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 47),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              color: Color(0xff49B6F3)),
                        ),
                        SizedBox(width: 47),
                        Icon(Icons.create_new_folder_outlined,
                            size: 35, color: Color(0xff49B6F3)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () =>
                      context.read<WelcomeScreenBloc>().add(NavigateToLogin()),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 65),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              color: Color(0xff49B6F3)),
                        ),
                        SizedBox(width: 60),
                        Icon(Icons.login_outlined,
                            color: Color(0xff49B6F3), size: 35)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 160),
                const Text(
                  'We do not collect any personal information other than your phone number.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Use this service without a ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'second thought.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
