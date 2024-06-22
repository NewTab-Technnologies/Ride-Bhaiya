// schedule_ride_event_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_event.dart';

void main() {
  group('ScheduleRideEvent', () {
    test('UpdateStartingPoint event has correct properties', () {
      final event = UpdateStartingPoint(startingPoint: 'Test Starting Point');
      expect(event.startingPoint, equals('Test Starting Point'));
    });

    test('UpdateDestination event has correct properties', () {
      final event = UpdateDestination(destination: 'Test Destination');
      expect(event.destination, equals('Test Destination'));
    });

    test('ScheduleRideButtonPressed event has correct properties', () {
      final event = ScheduleRideButtonPressed(
        startingPoint: 'Test Starting Point',
        destination: 'Test Destination',
        time: 'Test Time',
        seating: 'Test Seating',
        username: 'Test Username',
      );
      expect(event.startingPoint, equals('Test Starting Point'));
      expect(event.destination, equals('Test Destination'));
      expect(event.time, equals('Test Time'));
      expect(event.seating, equals('Test Seating'));
      expect(event.username, equals('Test Username'));
    });
  });
}
