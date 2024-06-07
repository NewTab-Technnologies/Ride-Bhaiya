// view_schedules_event.dart
import 'package:equatable/equatable.dart';

abstract class ViewScheduleEvent extends Equatable {
  const ViewScheduleEvent();

  @override
  List<Object> get props => [];
}

class FetchSchedules extends ViewScheduleEvent {}
