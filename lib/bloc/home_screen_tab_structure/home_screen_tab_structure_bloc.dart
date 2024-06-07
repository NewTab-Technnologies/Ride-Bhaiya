import 'package:bloc/bloc.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_sceen_tab_structure_event.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_state.dart';

class RideDetailsBloc extends Bloc<RideDetailsEvent, RideDetailsState> {
  final String? testErrorMessage;

  RideDetailsBloc({this.testErrorMessage}) : super(RideDetailsInitial()) {
    on<FetchRideDetails>(_onFetchRideDetails);
  }

  void _onFetchRideDetails(
      FetchRideDetails event, Emitter<RideDetailsState> emit) async {
    emit(RideDetailsLoading());

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      if (testErrorMessage != null) {
        throw Exception(testErrorMessage);
      }

      // Dummy data
      final rideDetails = [
        "Venkat Sai",
        "Dayton",
        "Denver Airport",
        "24th April 2024",
        "4:00 AM",
        "2",
        "(+1) 7203000803"
      ];
      emit(RideDetailsLoaded(rideDetails));
    } catch (e) {
      emit(RideDetailsError(e.toString()));
    }
  }

  void fetchRideDetails() {
    add(FetchRideDetails());
  }
}
