import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_sceen_tab_structure_event.dart';

void main() {
  group('RideDetailsEvent', () {
    test('FetchRideDetails supports value comparison', () {
      expect(FetchRideDetails(), FetchRideDetails());
    });

    test('FetchRideDetails props are empty', () {
      expect(FetchRideDetails().props, []);
    });
  });
}
