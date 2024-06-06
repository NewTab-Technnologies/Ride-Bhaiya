import 'package:equatable/equatable.dart';

abstract class GetRideScreenEvent extends Equatable {
  const GetRideScreenEvent();

  @override
  List<Object> get props => [];
}

class ViewSchedulesPressed extends GetRideScreenEvent {}

class RequestRidePressed extends GetRideScreenEvent {}
