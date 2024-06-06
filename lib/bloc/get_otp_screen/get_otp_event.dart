import 'package:equatable/equatable.dart';

abstract class GetOTPEvent extends Equatable {
  const GetOTPEvent();

  @override
  List<Object> get props => [];
}

class SubmitMobileNumber extends GetOTPEvent {
  const SubmitMobileNumber(); // Add this constructor

  @override
  List<Object> get props => [];
}

class SubmitUserName extends GetOTPEvent {
  final String userName;

  const SubmitUserName(this.userName);

  @override
  List<Object> get props => [userName];
}
