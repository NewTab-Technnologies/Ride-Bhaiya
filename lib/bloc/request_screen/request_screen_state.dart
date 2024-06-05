// lib/bloc/request_screen/request_screen_state.dart

import 'package:equatable/equatable.dart';

abstract class RequestRideState extends Equatable {
  const RequestRideState();

  @override
  List<Object> get props => [];
}

class RequestRideInitial extends RequestRideState {}

class RequestRideLoading extends RequestRideState {}

class RequestRideSuccess extends RequestRideState {}

class RequestRideFailure extends RequestRideState {
  final String error;

  const RequestRideFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RequestRideFailure(error: $error)';
}
