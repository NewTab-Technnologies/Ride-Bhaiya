import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_event.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_state.dart';
import 'package:ridebhaiya/screens/schedule_screen.dart';
import 'package:ridebhaiya/screens/view_requests_screen.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_bloc.dart';

class OfferRideScreen extends StatefulWidget {
  const OfferRideScreen({super.key});

  @override
  State<OfferRideScreen> createState() => _OfferRideScreenState();
}

class _OfferRideScreenState extends State<OfferRideScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OfferRideScreenBloc(),
      child: const OfferRideScreenView(),
    );
  }
}

class OfferRideScreenView extends StatefulWidget {
  const OfferRideScreenView({super.key});

  @override
  State<OfferRideScreenView> createState() => _OfferRideScreenViewState();
}

class _OfferRideScreenViewState extends State<OfferRideScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff49B6F3),
      appBar: AppBar(
        backgroundColor: const Color(0xff49B6F3),
        centerTitle: true,
        title: const Text(
          'RIDE BHAIYA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            fontFamily: 'Poppins',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<OfferRideScreenBloc, OfferRideScreenState>(
        listener: (context, state) {
          if (state is NavigatedToScheduleRide) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ScheduleRideScreen()));
          } else if (state is NavigatedToViewRequests) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ViewRequestsScreen()));
          }
        },
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25.0),
            Image.asset('assets/ride-1.png'),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: () {
                context.read<OfferRideScreenBloc>().add(ScheduleRide());
              },
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
                          'Schedule a Ride',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff49B6F3),
                            fontSize: 25.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.access_time_sharp,
                        color: Color(0xff49B6F3),
                        size: 40.0,
                      ),
                      SizedBox(width: 36.0),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            const Text(
              'If you wish to schedule a ride in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 5.0),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(text: 'advance, select '),
                  TextSpan(
                    text: 'Schedule a Ride.',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                context.read<OfferRideScreenBloc>().add(ViewRequests());
              },
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
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Text(
                          'View Requests',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff49B6F3),
                            fontSize: 25.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.calendar_month_sharp,
                        color: Color(0xff49B6F3),
                        size: 40.0,
                      ),
                      SizedBox(width: 36.0),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            const Text(
              'To see ride schedules, select',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'Explore Requests.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            )
          ],
        ),
      ),
    );
  }
}
