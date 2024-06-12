abstract class RequestRideEvent {}

class UpdateStartingPoint extends RequestRideEvent {
  final String startingPoint;

  UpdateStartingPoint({required this.startingPoint});
}

class UpdateDestination extends RequestRideEvent {
  final String destination;

  UpdateDestination({required this.destination});
}

class RequestRideButtonPressed extends RequestRideEvent {
  final String startingPoint;
  final String destination;
  final String time;
  final String seating;
  final String username;

  RequestRideButtonPressed({
    required this.startingPoint,
    required this.destination,
    required this.time,
    required this.seating,
    required this.username,
  });
}
