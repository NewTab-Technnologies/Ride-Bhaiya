import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_bloc.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_event.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_state.dart';
import 'package:ridebhaiya/screens/request_screen.dart';
import 'package:ridebhaiya/screens/view_schedule_screen.dart';

class GetRideScreen extends StatefulWidget {
  const GetRideScreen({super.key});

  @override
  State<GetRideScreen> createState() => _GetRideScreenState();
}

class _GetRideScreenState extends State<GetRideScreen> {
  late GetRideScreenBloc _getRideBloc;

  @override
  void initState() {
    super.initState();
    _getRideBloc = GetRideScreenBloc();
  }

  @override
  void dispose() {
    _getRideBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _getRideBloc,
      child: Scaffold(
        backgroundColor: const Color(0xff49B6F3),
        appBar: AppBar(
          backgroundColor: const Color(0xff49B6F3),
          title: const Text(
            'RIDE BHAIYA',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: BlocListener<GetRideScreenBloc, GetRideState>(
          listener: (context, state) {
            if (state is GetRideLoaded) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => state is ViewSchedulesPressed
                        ? const ViewScheduleScreen()
                        : const RequestRideScreen()),
              );
            } else if (state is GetRideError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<GetRideScreenBloc, GetRideState>(
            builder: (context, state) {
              if (state is GetRideLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Image.asset('assets/ridebhi.png'), // asset
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () => _getRideBloc.add(ViewSchedulesPressed()),
                    child: Container(
                      height: 60.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 15.0),
                            Expanded(
                              child: Text(
                                'View Schedules',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff49B6F3),
                                  fontSize: 25.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.access_time_rounded,
                              color: Color(0xff49B6F3),
                              size: 40.0,
                            ),
                            SizedBox(width: 35.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const Text(
                    'To see schedules, select',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'View Schedules.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () => _getRideBloc.add(RequestRidePressed()),
                    child: Container(
                      height: 60.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 40.0),
                            Expanded(
                              child: Text(
                                'Request a Ride',
                                style: TextStyle(
                                  color: Color(0xff49B6F3),
                                  fontSize: 25.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.calendar_month_sharp,
                              color: Color(0xff49B6F3),
                              size: 40.0,
                            ),
                            SizedBox(width: 35.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  RichText(
                    text: const TextSpan(
                      text: 'Select ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(
                          text: 'Request a Ride',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                        TextSpan(
                            text: ', to ask for a',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 20.0,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'ride.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
