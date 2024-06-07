import 'package:equatable/equatable.dart';

abstract class RideDetailsEvent extends Equatable {
  const RideDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FetchRideDetails extends RideDetailsEvent {}
