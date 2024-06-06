import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_ride_screen_event.dart';
import 'get_ride_screen_state.dart';

class GetRideScreenBloc extends Bloc<GetRideScreenEvent, GetRideState> {
  GetRideScreenBloc() : super(GetRideInitial()) {
    on<ViewSchedulesPressed>(_onViewSchedulesPressed);
    on<RequestRidePressed>(_onRequestRidePressed);
  }

  void _onViewSchedulesPressed(
      ViewSchedulesPressed event, Emitter<GetRideState> emit) async {
    emit(GetRideLoading());
    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulate network call
      emit(GetRideLoaded());
    } catch (e) {
      emit(GetRideError(e.toString()));
    }
  }

  void _onRequestRidePressed(
      RequestRidePressed event, Emitter<GetRideState> emit) async {
    emit(GetRideLoading());
    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulate network call
      emit(GetRideLoaded());
    } catch (e) {
      emit(GetRideError(e.toString()));
    }
  }
}
