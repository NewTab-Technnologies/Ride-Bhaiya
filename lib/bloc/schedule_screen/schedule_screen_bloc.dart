import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ridebhaiya/bloc/data_repository.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_event.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_state.dart';

class ScheduleRideBloc extends Bloc<ScheduleRideEvent, ScheduleRideState> {
  final DataRepository scheduleRepository;

  ScheduleRideBloc({required this.scheduleRepository})
      : super(ScheduleRideInitial()) {
    on<UpdateStartingPoint>(_mapUpdateStartingPointToState);
    on<UpdateDestination>(_mapUpdateDestinationToState);
    on<ScheduleRideButtonPressed>(_mapSubmitFormToState);
  }

  void _mapUpdateStartingPointToState(
      UpdateStartingPoint event, Emitter<ScheduleRideState> emit) {
    emit(ScheduleRideUpdated(
      startingPoint: event.startingPoint,
      destination: state is ScheduleRideUpdated
          ? (state as ScheduleRideUpdated).destination
          : '',
    ));
  }

  void _mapUpdateDestinationToState(
      UpdateDestination event, Emitter<ScheduleRideState> emit) {
    emit(ScheduleRideUpdated(
      startingPoint: state is ScheduleRideUpdated
          ? (state as ScheduleRideUpdated).startingPoint
          : '',
      destination: event.destination,
    ));
  }

  Future<void> _mapSubmitFormToState(
      ScheduleRideButtonPressed event, Emitter<ScheduleRideState> emit) async {
    emit(ScheduleRideLoading());
    try {
      await scheduleRepository.submitFormData({
        'destination': event.destination,
        'requestedBy': event.username,
        'scheduleDates': FieldValue.serverTimestamp(),
        'scheduleTime': event.time,
        'seatingFor': int.parse(event.seating),
        'startingPoint': event.startingPoint,
      }, 'schedules', 'schedules');

      emit(ScheduleRideSuccess());
    } catch (error) {
      emit(ScheduleRideFailure(error: error.toString()));
    }
  }
}
