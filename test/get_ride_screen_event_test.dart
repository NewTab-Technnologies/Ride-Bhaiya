import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_event.dart';

void main() {
  group('GetRideScreenEvent', () {
    test('ViewSchedulesPressed supports value comparison', () {
      expect(
        ViewSchedulesPressed(),
        equals(ViewSchedulesPressed()),
      );
    });

    test('RequestRidePressed supports value comparison', () {
      expect(
        RequestRidePressed(),
        equals(RequestRidePressed()),
      );
    });
  });
}
