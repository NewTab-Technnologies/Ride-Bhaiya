import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_state.dart';
import 'package:ridebhaiya/models/schedule_model.dart';

void main() {
  group('RideDetailsState', () {
    test('RideDetailsInitial supports value equality', () {
      expect(RideDetailsInitial(), equals(RideDetailsInitial()));
    });

    test('RideDetailsLoading supports value equality', () {
      expect(RideDetailsLoading(), equals(RideDetailsLoading()));
    });

    test('RideDetailsLoaded supports value equality', () {
      final Map<String, dynamic> rideDetails = {
        'destination': 'place 1',
        'requestedBy': 'user name',
        'scheduleDates': Timestamp.now(),
        'scheduleTime': 'Time',
        'seatingFor': int.parse('5'),
        'startingPoint': 'Someplace',
      };
      final schedule = ScheduleModel.fromJson(rideDetails);
      expect(RideDetailsLoaded(schedule), equals(RideDetailsLoaded(schedule)));
    });

    test('RideDetailsLoaded props are correct', () {
      final Map<String, dynamic> rideDetails = {
        'destination': 'place 1',
        'requestedBy': 'user name',
        'scheduleDates': Timestamp.now(),
        'scheduleTime': 'Time',
        'seatingFor': int.parse('5'),
        'startingPoint': 'Someplace',
      };
      final schedule = ScheduleModel.fromJson(rideDetails);
      expect(RideDetailsLoaded(schedule).props, [schedule]);
    });

    test('RideDetailsError supports value equality', () {
      const errorMessage = 'An error occurred';
      expect(const RideDetailsError(errorMessage),
          equals(const RideDetailsError(errorMessage)));
    });

    test('RideDetailsError props are correct', () {
      const errorMessage = 'An error occurred';
      expect(const RideDetailsError(errorMessage).props, [errorMessage]);
    });
  });
}
