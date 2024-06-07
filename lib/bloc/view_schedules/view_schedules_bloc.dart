// view_schedules_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view_schedules_event.dart';
import 'view_schedules_state.dart';

class ViewScheduleBloc extends Bloc<ViewScheduleEvent, ViewScheduleState> {
  ViewScheduleBloc() : super(ViewScheduleLoading()) {
    on<FetchSchedules>(_onFetchSchedules);
  }

  Future<void> _onFetchSchedules(
      FetchSchedules event, Emitter<ViewScheduleState> emit) async {
    emit(ViewScheduleLoading());
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      // Simulate fetching data
      final schedules = [
        "Venkat Sai",
        "Dayton",
        "Denver Airport",
        "24th April 2024",
        "4:00 AM",
        "2",
        "(+1) 7203000803"
      ];
      emit(ViewScheduleLoaded(schedules));
    } catch (e) {
      emit(ViewScheduleError(e.toString()));
    }
  }

  // For the StreamBuilder in the UI
  Stream<ViewScheduleState> get stateStream => stream;
}
