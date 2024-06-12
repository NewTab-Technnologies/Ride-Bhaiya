// lib/bloc/request_screen/request_screen_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_event.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_state.dart';
import 'package:ridebhaiya/bloc/data_repository.dart';

class RequestRideBloc extends Bloc<RequestRideEvent, RequestRideState> {
  final DataRepository scheduleRepository;

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
      await scheduleRepository.submitFormData({
        'destination': event.destination,
        'requestedBy': event.username,
        'requestDates': FieldValue.serverTimestamp(),
        'requestTime': event.time,
        'seatingFor': int.parse(event.seating),
        'startingPoint': event.startingPoint,
      }, 'request', 'request');
      emit(RequestRideSuccess());
    } catch (error) {
      emit(RequestRideFailure(error: error.toString()));
    }
  }
}
