import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_state.dart';

void main() {
  group('GetRideState', () {
    test('GetRideInitial supports value equality', () {
      expect(GetRideInitial(), GetRideInitial());
    });

    test('GetRideLoading supports value equality', () {
      expect(GetRideLoading(), GetRideLoading());
    });

    test('GetRideLoaded supports value equality', () {
      expect(GetRideLoaded(), GetRideLoaded());
    });

    test('GetRideError supports value equality', () {
      expect(GetRideError(message: "Error"), GetRideError(message: "Error"));
    });

    test('props are correct for GetRideInitial', () {
      expect(GetRideInitial().props, []);
    });

    test('props are correct for GetRideLoading', () {
      expect(GetRideLoading().props, []);
    });

    test('props are correct for GetRideLoaded', () {
      expect(GetRideLoaded().props, []);
    });

    test('props are correct for GetRideError', () {
      expect(GetRideError(message: "Error").props, ["Error"]);
    });
  });
}
