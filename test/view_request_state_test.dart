// view_request_state_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_state.dart';

void main() {
  group('ViewRequestsState', () {
    test('supports value comparisons for ViewRequestsLoading', () {
      expect(ViewRequestsLoading(), ViewRequestsLoading());
    });

    test('supports value comparisons for ViewRequestsLoaded', () {
      expect(ViewRequestsLoaded(const ["Request 1"]),
          ViewRequestsLoaded(const ["Request 1"]));
      expect(
        ViewRequestsLoaded(const ["Request 1", "Request 2"]),
        isNot(ViewRequestsLoaded(const ["Request 1"])),
      );
    });

    test('supports value comparisons for ViewRequestsError', () {
      expect(ViewRequestsError("Error"), ViewRequestsError("Error"));
      expect(
        ViewRequestsError("Error 1"),
        isNot(ViewRequestsError("Error 2")),
      );
    });
  });
}
