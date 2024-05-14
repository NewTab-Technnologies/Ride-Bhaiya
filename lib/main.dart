import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/request_ride_schedule_tile.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      home: ScheduleTile(),
    );
  }
}