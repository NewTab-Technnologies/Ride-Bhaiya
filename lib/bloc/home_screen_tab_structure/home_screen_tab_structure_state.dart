import 'package:equatable/equatable.dart';

abstract class RideDetailsState extends Equatable {
  const RideDetailsState();

  @override
  List<Object?> get props => [];
}

class RideDetailsInitial extends RideDetailsState {}

class RideDetailsLoading extends RideDetailsState {}

class RideDetailsLoaded extends RideDetailsState {
  final List<String> rideDetails;

  const RideDetailsLoaded(this.rideDetails);

  @override
  List<Object?> get props => [rideDetails];
}

class RideDetailsError extends RideDetailsState {
  final String errorMessage;

  const RideDetailsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
