import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/request_screen.dart';
import 'package:ridebhaiya/screens/view_schedule_screen.dart';

class GetRideScreen extends StatefulWidget {
  const GetRideScreen({super.key});

  @override
  State<GetRideScreen> createState() => _RidebhaiyaState();
}

class _RidebhaiyaState extends State<GetRideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20.0),
          Image.asset('assets/ridebhi.png'),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ViewScheduleScreen()),
            ),
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RequestRideScreen()),
            ),
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
      ),
    );
  }
}
