import 'package:equatable/equatable.dart';

abstract class GetRideState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetRideInitial extends GetRideState {}

class GetRideLoading extends GetRideState {}

class GetRideLoaded extends GetRideState {}

class GetRideError extends GetRideState {
  final String message;

  GetRideError({required this.message});

  @override
  List<Object> get props => [message];
}
