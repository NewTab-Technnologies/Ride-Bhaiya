import 'package:equatable/equatable.dart';
import 'package:ridebhaiya/models/schedule_model.dart';

abstract class RideDetailsState extends Equatable {
  const RideDetailsState();

  @override
  List<Object?> get props => [];
}

class RideDetailsInitial extends RideDetailsState {}

class RideDetailsLoading extends RideDetailsState {}

class RideDetailsLoaded extends RideDetailsState {
  final ScheduleModel scheduleDetails;
  //add another parameter requestDetails and pass it

  const RideDetailsLoaded(this.scheduleDetails);

  @override
  List<Object?> get props => [scheduleDetails];
}

class RideDetailsError extends RideDetailsState {
  final String errorMessage;

  const RideDetailsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
