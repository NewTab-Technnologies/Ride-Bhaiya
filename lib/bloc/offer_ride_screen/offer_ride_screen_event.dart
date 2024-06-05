import 'package:equatable/equatable.dart';

abstract class OfferRideScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ScheduleRide extends OfferRideScreenEvent {}

class ViewRequests extends OfferRideScreenEvent {}
