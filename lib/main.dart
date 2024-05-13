import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
      home: Ride(),
    ));

class Ride extends StatefulWidget {
  const Ride({Key? key}) : super(key: key);

  @override
  State<Ride> createState() => _RideState();
}

class _RideState extends State<Ride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff49B6F3),
      appBar: AppBar(
        backgroundColor: Color(0xff49B6F3),
        centerTitle: true,
        title: Text(
          'RIDE BHAIYA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 25.0),
          Image.asset('assets/ride-1.jpg'),
          SizedBox(height: 25.0),
          GestureDetector(
            onTap: () => Navigator(), // Placeholder for onTap function
            child: Container(
              height: 60.0,
              width: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Schedule a Ride',
                      style: TextStyle(
                        color: Color(0xff49B6F3),
                        fontSize: 25.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Icon(
                      Icons.access_time_sharp,
                      color: Color(0xff49B6F3),
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Text(
            'If you wish to schedule a ride in',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 5.0),
          RichText(
            text: TextSpan(
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
          SizedBox(height: 40.0),
          GestureDetector(
            onTap: () => Navigator(), // Placeholder for onTap function
            child: Container(
              height: 60.0,
              width: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View Requests',
                      style: TextStyle(
                        color: Color(0xff49B6F3),
                        fontSize: 25.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Icon(
                      Icons.calendar_month_sharp,
                      color: Color(0xff49B6F3),
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Text(
            'To see ride schedules, select',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 5.0),
          Text(
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
    );
  }
}
