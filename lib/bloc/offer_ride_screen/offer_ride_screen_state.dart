import 'package:equatable/equatable.dart';

abstract class OfferRideScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialOfferState extends OfferRideScreenState {}

class NavigatedToScheduleRide extends OfferRideScreenState {}

class NavigatedToViewRequests extends OfferRideScreenState {}
