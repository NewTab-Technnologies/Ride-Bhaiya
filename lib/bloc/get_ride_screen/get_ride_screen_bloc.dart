import 'package:bloc/bloc.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_event.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_state.dart';

class GetRideScreenBloc extends Bloc<GetRideEvent, GetRideState> {
  GetRideScreenBloc() : super(GetRideLoading()) {
    on<ViewSchedulesPressed>((event, emit) {
      emit(GetRideLoaded());
    });
    on<RequestRidePressed>((event, emit) {
      emit(GetRideLoaded());
    });
  }
}
