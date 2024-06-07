// view_schedules_state.dart
import 'package:equatable/equatable.dart';

abstract class ViewScheduleState extends Equatable {
  const ViewScheduleState();

  @override
  List<Object> get props => [];
}

class ViewScheduleLoading extends ViewScheduleState {}

class ViewScheduleLoaded extends ViewScheduleState {
  final List<String> schedules;

  const ViewScheduleLoaded(this.schedules);

  @override
  List<Object> get props => [schedules];
}

class ViewScheduleError extends ViewScheduleState {
  final String error;

  const ViewScheduleError(this.error);

  @override
  List<Object> get props => [error];
}
