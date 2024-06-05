import 'package:equatable/equatable.dart';

abstract class GetRideEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewSchedulesPressed extends GetRideEvent {}

class RequestRidePressed extends GetRideEvent {}
