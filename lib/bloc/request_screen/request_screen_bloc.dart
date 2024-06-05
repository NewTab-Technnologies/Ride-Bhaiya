// lib/bloc/request_screen/request_screen_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_event.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_state.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_repositary.dart';

class RequestRideBloc extends Bloc<RequestRideEvent, RequestRideState> {
  final ScheduleRepository scheduleRepository;

  RequestRideBloc({required this.scheduleRepository})
      : super(RequestRideInitial()) {
    on<RequestRideButtonPressed>(_onRequestRideButtonPressed);
  }

  Future<void> _onRequestRideButtonPressed(
    RequestRideButtonPressed event,
    Emitter<RequestRideState> emit,
  ) async {
    emit(RequestRideLoading());

    try {
      await scheduleRepository.submitFormData(
        event.startingPoint,
        event.destination,
        event.time,
        event.seating,
      );
      emit(RequestRideSuccess());
    } catch (error) {
      emit(RequestRideFailure(error: error.toString()));
    }
  }
}
