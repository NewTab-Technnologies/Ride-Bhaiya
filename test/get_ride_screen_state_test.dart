import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_state.dart';

void main() {
  group('GetRideState', () {
    test('GetRideInitial supports value comparison', () {
      expect(
        GetRideInitial(),
        equals(GetRideInitial()),
      );
    });

    test('GetRideLoading supports value comparison', () {
      expect(
        GetRideLoading(),
        equals(GetRideLoading()),
      );
    });

    test('GetRideLoaded supports value comparison', () {
      expect(
        GetRideLoaded(),
        equals(GetRideLoaded()),
      );
    });

    test('GetRideError supports value comparison', () {
      const message = 'An error occurred';
      expect(
        const GetRideError(message),
        equals(const GetRideError(message)),
      );
    });

    test('GetRideError has correct props', () {
      const message = 'An error occurred';
      expect(
        const GetRideError(message).props,
        equals([message]),
      );
    });
  });
}
