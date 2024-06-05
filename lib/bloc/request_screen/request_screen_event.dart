// lib/bloc/request_screen/request_screen_event.dart

import 'package:equatable/equatable.dart';

abstract class RequestRideEvent extends Equatable {
  const RequestRideEvent();

  @override
  List<Object> get props => [];
}

class RequestRideButtonPressed extends RequestRideEvent {
  final String startingPoint;
  final String destination;
  final String time;
  final String seating;

  const RequestRideButtonPressed({
    required this.startingPoint,
    required this.destination,
    required this.time,
    required this.seating,
  });

  @override
  List<Object> get props => [startingPoint, destination, time, seating];

  @override
  String toString() {
    return 'RequestRideButtonPressed(startingPoint: $startingPoint, destination: $destination, time: $time, seating: $seating)';
  }
}
