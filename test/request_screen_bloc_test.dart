import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_event.dart';

void main() {
  group('RequestRideEvent', () {
    test('UpdateStartingPoint event has correct properties', () {
      final event = UpdateStartingPoint(startingPoint: 'Test Starting Point');
      expect(event.startingPoint, equals('Test Starting Point'));
    });

    test('UpdateDestination event has correct properties', () {
      final event = UpdateDestination(destination: 'Test Destination');
      expect(event.destination, equals('Test Destination'));
    });

    test('RequestRideButtonPressed event has correct properties', () {
      final event = RequestRideButtonPressed(
        startingPoint: '',
        destination: '',
        time: '00:00',
        seating: '',
        username: '',
      );
      expect(event.startingPoint, equals(''));
      expect(event.destination, equals(''));
      expect(event.time, equals('00:00'));
      expect(event.seating, equals(''));
      expect(event.username, equals(''));
    });
  });
}
