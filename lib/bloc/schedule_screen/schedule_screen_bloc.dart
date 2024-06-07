import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_repositary.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_event.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_state.dart';

class ScheduleRideBloc extends Bloc<ScheduleRideEvent, ScheduleRideState> {
  final ScheduleRepository scheduleRepository;

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
      await scheduleRepository.submitFormData(
        event.startingPoint,
        event.destination,
        event.time,
        event.seating,
      );
      emit(ScheduleRideSuccess());
    } catch (error) {
      emit(ScheduleRideFailure(error: error.toString()));
    }
  }
}
