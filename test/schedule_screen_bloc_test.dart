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
        startingPoint: '',
        destination: '',
        time: '00:00',
        seating: '1',
      );
      expect(event.startingPoint, equals(''));
      expect(event.destination, equals(''));
      expect(event.time, equals('00:00'));
      expect(event.seating, equals('1'));
    });
  });
}
