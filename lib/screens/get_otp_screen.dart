import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_bloc.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_event.dart';
import 'package:ridebhaiya/bloc/get_otp_screen/get_otp_state.dart';
import 'package:ridebhaiya/screens/otp_verification_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GetOTPScreen extends StatefulWidget {
  static String verify = '';

  const GetOTPScreen({super.key, this.page = 'login'});
  final String page;

  @override
  State<GetOTPScreen> createState() => _GetOTPScreenState();
}

class _GetOTPScreenState extends State<GetOTPScreen> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OTPBloc(),
      child: Scaffold(
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
        body: BlocListener<OTPBloc, OTPState>(
          listener: (context, state) {
            if (state is OTPVerificationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is OTPPhoneVerified) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OTPVerificationScreen(
                    phoneNumber: '+91${_phoneController.text.trim()}',
                    username: widget.page == 'login'
                        ? null
                        : _nameController.text.trim(),
                    verificationId:
                        state.verificationId, // Pass verification ID
                  ),
                ),
              );
            } else if (state is UsernameAvailabilityChecked) {
              if (state.isTaken) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Username already exists')),
                );
              }
            }
          },
          child: BlocBuilder<OTPBloc, OTPState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 180.0),
                      Center(
                        child: widget.page == 'login'
                            ? const Text(
                                'OTP \nVerification',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 29.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppinsm',
                                  letterSpacing: 1.0,
                                ),
                              )
                            : const Text(
                                'Enter your \nDetails',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 29.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppinsm',
                                  letterSpacing: 1.0,
                                ),
                              ),
                      ),
                      const SizedBox(height: 60.0),
                      if (widget.page != 'login')
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Enter Your User Name',
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'Poppinsm',
                              ),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Icon(Icons.person,
                                    color: Colors.white, size: 33.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(65.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 4.3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(65.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 4.0,
                                ),
                              ),
                            ),
                            cursorColor: Colors.white,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              if (value.contains(' ')) {
                                return 'Username cannot contain spaces';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              context.read<OTPBloc>().add(
                                  CheckUsernameAvailability(username: value));
                            },
                          ),
                        ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Enter Your Mobile Number',
                            prefix: const Text(
                              '+91',
                              style: TextStyle(color: Colors.white),
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Poppinsm',
                            ),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(Icons.phone,
                                  color: Colors.white, size: 33.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(65.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 4.3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(65.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 4.0,
                              ),
                            ),
                          ),
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            if (value.length != 10) {
                              return 'Mobile number must be 10 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 45.0),
                      state is OTPLoading
                          ? const SpinKitRipple(
                              color: Colors.white,
                              size: 60.0,
                            )
                          : GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<OTPBloc>().add(VerifyPhoneNumber(
                                        phoneNumber: _phoneController.text,
                                        username: widget.page == 'login'
                                            ? null
                                            : _nameController.text,
                                      ));
                                }
                              },
                              child: Container(
                                height: 60.0,
                                width: 215.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
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
            },
          ),
        ),
      ),
    );
  }
}
