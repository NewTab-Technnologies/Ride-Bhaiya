// view_schedules_state_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_state.dart';

void main() {
  group('ViewScheduleState', () {
    test('supports value comparisons for ViewScheduleLoading', () {
      expect(ViewScheduleLoading(), ViewScheduleLoading());
    });

    test('supports value comparisons for ViewScheduleLoaded', () {
      expect(const ViewScheduleLoaded(["Schedule 1"]),
          const ViewScheduleLoaded(["Schedule 1"]));
      expect(
        const ViewScheduleLoaded(["Schedule 1", "Schedule 2"]),
        isNot(const ViewScheduleLoaded(["Schedule 1"])),
      );
    });

    test('supports value comparisons for ViewScheduleError', () {
      expect(
          const ViewScheduleError("Error"), const ViewScheduleError("Error"));
      expect(
        const ViewScheduleError("Error 1"),
        isNot(const ViewScheduleError("Error 2")),
      );
    });
  });
}
