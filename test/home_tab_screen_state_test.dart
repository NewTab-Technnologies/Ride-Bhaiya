import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_state.dart';

void main() {
  group('RideDetailsState', () {
    test('RideDetailsInitial supports value comparison', () {
      expect(RideDetailsInitial(), RideDetailsInitial());
    });

    test('RideDetailsLoading supports value comparison', () {
      expect(RideDetailsLoading(), RideDetailsLoading());
    });

    test('RideDetailsLoaded supports value comparison', () {
      final rideDetails = ['Ride 1', 'Ride 2'];
      expect(RideDetailsLoaded(rideDetails), RideDetailsLoaded(rideDetails));
    });

    test('RideDetailsLoaded props contain rideDetails', () {
      final rideDetails = ['Ride 1', 'Ride 2'];
      expect(RideDetailsLoaded(rideDetails).props, [rideDetails]);
    });

    test('RideDetailsError supports value comparison', () {
      const errorMessage = 'An error occurred';
      expect(const RideDetailsError(errorMessage),
          const RideDetailsError(errorMessage));
    });

    test('RideDetailsError props contain errorMessage', () {
      const errorMessage = 'An error occurred';
      expect(const RideDetailsError(errorMessage).props, [errorMessage]);
    });
  });
}
