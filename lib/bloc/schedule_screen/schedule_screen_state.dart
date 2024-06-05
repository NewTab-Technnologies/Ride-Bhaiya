abstract class ScheduleRideState {}

class ScheduleRideInitial extends ScheduleRideState {}

class ScheduleRideLoading extends ScheduleRideState {}

class ScheduleRideSuccess extends ScheduleRideState {}

class ScheduleRideFailure extends ScheduleRideState {
  final String error;

  ScheduleRideFailure({required this.error});
}

class ScheduleRideUpdated extends ScheduleRideState {
  final String startingPoint;
  final String destination;

  ScheduleRideUpdated({
    required this.startingPoint,
    required this.destination,
  });
}
