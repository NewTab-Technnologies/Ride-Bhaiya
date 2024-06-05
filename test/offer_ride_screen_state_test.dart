import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_state.dart';

void main() {
  group('OfferRideScreenState', () {
    test('InitialOfferState supports value equality', () {
      expect(InitialOfferState(), InitialOfferState());
    });

    test('NavigatedToScheduleRide supports value equality', () {
      expect(NavigatedToScheduleRide(), NavigatedToScheduleRide());
    });

    test('NavigatedToViewRequests supports value equality', () {
      expect(NavigatedToViewRequests(), NavigatedToViewRequests());
    });

    test('props are correct for InitialOfferState', () {
      expect(InitialOfferState().props, []);
    });

    test('props are correct for NavigatedToScheduleRide', () {
      expect(NavigatedToScheduleRide().props, []);
    });

    test('props are correct for NavigatedToViewRequests', () {
      expect(NavigatedToViewRequests().props, []);
    });
  });
}
