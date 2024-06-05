import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_screen_state.dart';

void main() {
  group('ScheduleRideState', () {
    test('ScheduleRideInitial state is initialized correctly', () {
      final state = ScheduleRideInitial();
      expect(state, isA<ScheduleRideInitial>());
    });

    test('ScheduleRideLoading state is initialized correctly', () {
      final state = ScheduleRideLoading();
      expect(state, isA<ScheduleRideLoading>());
    });

    test('ScheduleRideSuccess state is initialized correctly', () {
      final state = ScheduleRideSuccess();
      expect(state, isA<ScheduleRideSuccess>());
    });

    test('ScheduleRideFailure state is initialized correctly', () {
      const error = 'Test Error Message';
      final state = ScheduleRideFailure(error: error);
      expect(state.error, equals('Test Error Message'));
    });

    test('ScheduleRideUpdated state has correct properties', () {
      final state = ScheduleRideUpdated(
        startingPoint: 'Test Starting Point',
        destination: 'Test Destination',
      );
      expect(state.startingPoint, equals('Test Starting Point'));
      expect(state.destination, equals('Test Destination'));
    });
  });
}
