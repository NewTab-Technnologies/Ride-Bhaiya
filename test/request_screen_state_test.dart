// test/bloc/request_screen/request_screen_state_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_state.dart';

void main() {
  group('RequestRideState', () {
    test('props are correct for RequestRideInitial', () {
      final state = RequestRideInitial();
      expect(state.props, []);
    });

    test('props are correct for RequestRideLoading', () {
      final state = RequestRideLoading();
      expect(state.props, []);
    });

    test('props are correct for RequestRideSuccess', () {
      final state = RequestRideSuccess();
      expect(state.props, []);
    });

    test('props are correct for RequestRideFailure', () {
      const state = RequestRideFailure(error: 'error');
      expect(state.props, ['error']);
    });

    test('RequestRideFailure has correct props and toString', () {
      const state = RequestRideFailure(error: 'error');
      expect(state.props, ['error']);
      expect(
        state.toString(),
        'RequestRideFailure(error: error)',
      );
    });
  });
}
