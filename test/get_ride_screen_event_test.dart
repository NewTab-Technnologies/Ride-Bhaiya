import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_event.dart';

void main() {
  group('GetRideEvent', () {
    test('ViewSchedulesPressed supports value equality', () {
      expect(ViewSchedulesPressed(), ViewSchedulesPressed());
    });

    test('RequestRidePressed supports value equality', () {
      expect(RequestRidePressed(), RequestRidePressed());
    });

    test('props are correct for ViewSchedulesPressed', () {
      expect(ViewSchedulesPressed().props, []);
    });

    test('props are correct for RequestRidePressed', () {
      expect(RequestRidePressed().props, []);
    });
  });
}
