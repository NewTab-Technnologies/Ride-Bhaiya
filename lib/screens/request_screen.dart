import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_bloc.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_event.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_state.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_repositary.dart';
import 'package:ridebhaiya/screens/request_success_screen.dart';
import 'package:ridebhaiya/widgets/form_component.dart';

class RequestRideScreen extends StatefulWidget {
  const RequestRideScreen({super.key});

  @override
  State<RequestRideScreen> createState() => _RequestRideScreenState();
}

class _RequestRideScreenState extends State<RequestRideScreen> {
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
      body: BlocProvider(
        create: (context) =>
            RequestRideBloc(scheduleRepository: ScheduleRepository()),
        child: BlocListener<RequestRideBloc, RequestRideState>(
          listener: (context, state) {
            if (state is RequestRideSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const RequestSuccessScreen()),
                (Route<dynamic> route) => false,
              );
            } else if (state is RequestRideFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to request ride: ${state.error}'),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 100),
                const Text(
                  'Request a Ride',
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
                  formFor: 'Request',
                ),
                BlocBuilder<RequestRideBloc, RequestRideState>(
                  builder: (context, state) {
                    if (state is RequestRideLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<RequestRideBloc>(context).add(
                          RequestRideButtonPressed(
                            startingPoint: _startingPointController.text,
                            destination: _destinationController.text,
                            time: _timeController.text,
                            seating: _seatingController.text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 20.0),
                              Expanded(
                                flex: 8,
                                child: Text(
                                  'Send Request',
                                  style: TextStyle(
                                    color: Color(0xFF49B6F3),
                                    fontFamily: 'Poppins',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.help_outline_outlined,
                                  color: Color(0xFF49B6F3),
                                  size: 45,
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
    );
  }
}
