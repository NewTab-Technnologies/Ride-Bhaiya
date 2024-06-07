import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_event.dart';

void main() {
  group('OfferRideScreenEvent', () {
    test('ScheduleRide supports value equality', () {
      expect(ScheduleRide(), ScheduleRide());
    });

    test('ViewRequests supports value equality', () {
      expect(ViewRequests(), ViewRequests());
    });

    test('props are correct for ScheduleRide', () {
      expect(ScheduleRide().props, []);
    });

    test('props are correct for ViewRequests', () {
      expect(ViewRequests().props, []);
    });
  });
}
