import 'package:equatable/equatable.dart';

abstract class GetOTPState extends Equatable {
  const GetOTPState();

  @override
  List<Object> get props => [];
}

class GetOTPInitial extends GetOTPState {}

class GetOTPLoading extends GetOTPState {}

class GetOTPSuccess extends GetOTPState {}

class GetOTPError extends GetOTPState {
  final String message;

  const GetOTPError(this.message);

  @override
  List<Object> get props => [message];
}
