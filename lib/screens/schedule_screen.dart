import 'package:flutter/material.dart';

class ScheduleRideScreen extends StatefulWidget {
  const ScheduleRideScreen({super.key});

  @override
  State<ScheduleRideScreen> createState() => _ScheduleRideScreenState();
}

class _ScheduleRideScreenState extends State<ScheduleRideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RIDE BHAIYA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF49B6F3),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF49B6F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 15),
              const Text(
                'Schedule a Ride',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const ScheduleRideForm(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  alignment: Alignment.center,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Row(
                      children: [
                        SizedBox(width: 40),
                        Expanded(
                          flex: 8,
                          child: Text(
                            'Schedule',
                            style: TextStyle(
                              color: Color(0xFF49B6F3),
                              fontFamily: 'Poppins',
                              fontSize: 35.0,
                              fontWeight: FontWeight.w100,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 30),
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.access_time,
                            color: Color(0xFF49B6F3),
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleRideForm extends StatefulWidget {
  const ScheduleRideForm({super.key});

  @override
  State<ScheduleRideForm> createState() => _ScheduleRideFormState();
}

class _ScheduleRideFormState extends State<ScheduleRideForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
