import 'package:flutter/material.dart';

class RequestRideScreen extends StatefulWidget {
  const RequestRideScreen({super.key});

  @override
  State<RequestRideScreen> createState() => _RequestRideScreenState();
}

class _RequestRideScreenState extends State<RequestRideScreen> {
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
                'Request a Ride',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const RequestRideForm(),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 40.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestRideForm extends StatefulWidget {
  const RequestRideForm({super.key});

  @override
  State<RequestRideForm> createState() => _RequestRideFormState();
}

class _RequestRideFormState extends State<RequestRideForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
