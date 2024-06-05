abstract class ScheduleRideEvent {}

class UpdateStartingPoint extends ScheduleRideEvent {
  final String startingPoint;

  UpdateStartingPoint({required this.startingPoint});
}

class UpdateDestination extends ScheduleRideEvent {
  final String destination;

  UpdateDestination({required this.destination});
}

class ScheduleRideButtonPressed extends ScheduleRideEvent {
  final String startingPoint;
  final String destination;
  final String time;
  final String seating;

  ScheduleRideButtonPressed({
    required this.startingPoint,
    required this.destination,
    required this.time,
    required this.seating,
  });
}
