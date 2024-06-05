// view_request_event.dart
import 'package:equatable/equatable.dart';

abstract class ViewRequestsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRequests extends ViewRequestsEvent {}
