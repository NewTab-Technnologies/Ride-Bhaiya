import 'package:bloc/bloc.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_event.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_state.dart';

class OfferRideScreenBloc
    extends Bloc<OfferRideScreenEvent, OfferRideScreenState> {
  OfferRideScreenBloc() : super(InitialOfferState()) {
    on<ScheduleRide>((event, emit) {
      emit(NavigatedToScheduleRide());
    });
    on<ViewRequests>((event, emit) {
      emit(NavigatedToViewRequests());
    });
  }
}
