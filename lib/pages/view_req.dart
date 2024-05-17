import 'package:flutter/material.dart';

class ViewRequestsScreen extends StatefulWidget {
  const ViewRequestsScreen({super.key});

  @override
  State<ViewRequestsScreen> createState() => _ViewRequestsScreenState();
}

class _ViewRequestsScreenState extends State<ViewRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff49B6F3),
        appBar: AppBar(
          key: Key('app_bar'),
          backgroundColor: Color(0xff49B6F3),
          title: const Center(
            child: Text(
              'RIDE BHAIYA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Center(child: Text('View Requests',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: 'Poppins'
                ),),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 357,
                height: 270,
                child: Center(
                  child: Text('Requests',
                    style: TextStyle(
                        fontSize: 25.0,
                        color:Color(0xff49B6F3)
                    ),),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0)
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 357,
                height: 270,
                child: Center(
                  child: Text('Requests',
                    style: TextStyle(
                        fontSize: 25.0,
                        color:Color(0xff49B6F3)
                    ),),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0)
                ),
              ),
          
            ],
          ),
        )

    );
  }
}