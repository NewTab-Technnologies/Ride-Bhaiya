// view_schedules_bloc_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_bloc.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_event.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_state.dart';

void main() {
  group('ViewScheduleBloc', () {
    late ViewScheduleBloc viewScheduleBloc;

    setUp(() {
      viewScheduleBloc = ViewScheduleBloc();
    });

    tearDown(() {
      viewScheduleBloc.close();
    });

    test('initial state is ViewScheduleLoading', () {
      expect(viewScheduleBloc.state, ViewScheduleLoading());
    });

    blocTest<ViewScheduleBloc, ViewScheduleState>(
      'emits [ViewScheduleLoading, ViewScheduleLoaded] when FetchSchedules is added',
      build: () => viewScheduleBloc,
      act: (bloc) => bloc.add(FetchSchedules()),
      wait: const Duration(
          seconds: 3), // Add wait to ensure async operations complete
      expect: () => [
        ViewScheduleLoading(),
        const ViewScheduleLoaded([
          "Venkat Sai",
          "Dayton",
          "Denver Airport",
          "24th April 2024",
          "4:00 AM",
          "2",
          "(+1) 7203000803"
        ]),
      ],
    );

    blocTest<ViewScheduleBloc, ViewScheduleState>(
      'emits [ViewScheduleLoading, ViewScheduleError] when an error occurs',
      build: () => ViewScheduleBloc(),
      act: (bloc) async {
        bloc.emit(ViewScheduleLoading());
        bloc.emit(const ViewScheduleError('Error occurred'));
      },
      expect: () => [
        ViewScheduleLoading(),
        const ViewScheduleError('Error occurred'),
      ],
    );
  });
}
