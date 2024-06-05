// view_schedules_event_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_event.dart';

void main() {
  group('ViewScheduleEvent', () {
    test('supports value comparisons for FetchSchedules', () {
      expect(FetchSchedules(), FetchSchedules());
    });
  });
}
