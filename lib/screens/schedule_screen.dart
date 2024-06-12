import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/bloc/data_repository.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_bloc.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_event.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_state.dart';
import 'package:ridebhaiya/screens/confirm.dart';
import 'package:ridebhaiya/widgets/form_component.dart';

class ScheduleRideScreen extends StatefulWidget {
  static String uid = '';
  const ScheduleRideScreen({super.key});

  @override
  ScheduleRideScreenState createState() => ScheduleRideScreenState();
}

class ScheduleRideScreenState extends State<ScheduleRideScreen> {
  final TextEditingController _startingPointController =
      TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _seatingController = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    // FirebaseFirestore.instance.collection('user').doc().get();
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc('MwwkLsi06OM9TojOt7hVxdf9NPf1')
          .get();
      setState(() {
        _username = userDoc['username'];
      });
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch username: $error'),
        ),
      );
    }
  }

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
      body: BlocProvider(
        create: (context) =>
            ScheduleRideBloc(scheduleRepository: DataRepository()),
        child: BlocListener<ScheduleRideBloc, ScheduleRideState>(
          listener: (context, state) {
            if (state is ScheduleRideSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfirmScreen()),
              );
            } else if (state is ScheduleRideFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to schedule ride: ${state.error}'),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),
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
                  BlocBuilder<ScheduleRideBloc, ScheduleRideState>(
                    builder: (context, state) {
                      if (state is ScheduleRideLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ScheduleRideBloc>(context).add(
                            ScheduleRideButtonPressed(
                              startingPoint: _startingPointController.text,
                              destination: _destinationController.text,
                              time: _timeController.text,
                              seating: _seatingController.text,
                              username: _username,
                            ),
                          );
                        },
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
