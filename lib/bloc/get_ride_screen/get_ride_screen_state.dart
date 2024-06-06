import 'package:equatable/equatable.dart';

abstract class GetRideState extends Equatable {
  const GetRideState();

  @override
  List<Object> get props => [];
}

class GetRideInitial extends GetRideState {}

class GetRideLoading extends GetRideState {}

class GetRideLoaded extends GetRideState {}

class GetRideError extends GetRideState {
  final String message;

  const GetRideError(this.message);

  @override
  List<Object> get props => [message];
}
