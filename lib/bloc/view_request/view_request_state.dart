// view_request_state.dart
import 'package:equatable/equatable.dart';

abstract class ViewRequestsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ViewRequestsLoading extends ViewRequestsState {}

class ViewRequestsLoaded extends ViewRequestsState {
  final List<String> requests;

  ViewRequestsLoaded(this.requests);

  @override
  List<Object?> get props => [requests];
}

class ViewRequestsError extends ViewRequestsState {
  final String error;

  ViewRequestsError(this.error);

  @override
  List<Object?> get props => [error];
}
