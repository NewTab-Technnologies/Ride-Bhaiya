import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/confirm.dart';
import 'package:ridebhaiya/widgets/form_component.dart';

class ScheduleRideScreen extends StatefulWidget {
  const ScheduleRideScreen({super.key});

  @override
  State<ScheduleRideScreen> createState() => _ScheduleRideScreenState();
}

class _ScheduleRideScreenState extends State<ScheduleRideScreen> {
  final _startingPointController = TextEditingController();
  final _destinationController = TextEditingController();
  final _timeController = TextEditingController();
  final _seatingController = TextEditingController();

  @override
  void dispose() {
    _startingPointController.dispose();
    _destinationController.dispose();
    _timeController.dispose();
    _seatingController.dispose();
    super.dispose();
  }

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
        automaticallyImplyLeading: false,
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
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
              FormComponent(
                startingPointController: _startingPointController,
                destinationController: _destinationController,
                timeController: _timeController,
                seatingController: _seatingController,
                formFor: 'Schedule',
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConfirmScreen()),
                  (Route<dynamic> route) => false,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
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
