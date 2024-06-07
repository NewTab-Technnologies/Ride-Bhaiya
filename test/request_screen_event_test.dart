// test/bloc/request_screen/request_screen_event_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_event.dart';

void main() {
  group('RequestRideEvent', () {
    test('props are correct for RequestRideButtonPressed', () {
      const event = RequestRideButtonPressed(
        startingPoint: 'Start',
        destination: 'Destination',
        time: '10:00 AM',
        seating: '4',
      );
      expect(event.props, ['Start', 'Destination', '10:00 AM', '4']);
    });

    test('RequestRideButtonPressed has correct props and toString', () {
      const event = RequestRideButtonPressed(
        startingPoint: 'Start',
        destination: 'Destination',
        time: '10:00 AM',
        seating: '4',
      );

      expect(event.props, ['Start', 'Destination', '10:00 AM', '4']);
      expect(
        event.toString(),
        'RequestRideButtonPressed(startingPoint: Start, destination: Destination, time: 10:00 AM, seating: 4)',
      );
    });
  });
}
