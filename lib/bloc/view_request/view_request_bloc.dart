// view_request_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view_request_event.dart';
import 'view_request_state.dart';

class ViewRequestsBloc extends Bloc<ViewRequestsEvent, ViewRequestsState> {
  ViewRequestsBloc() : super(ViewRequestsLoading()) {
    on<FetchRequests>(_onFetchRequests);
  }

  Future<void> _onFetchRequests(
      FetchRequests event, Emitter<ViewRequestsState> emit) async {
    emit(ViewRequestsLoading());
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      // Simulate fetching data
      final requests = [
        "Venkat Sai",
        "Dayton",
        "Denver Airport",
        "24th April 2024",
        "4:00 AM",
        "2",
        "(+1) 7203000803"
      ];
      emit(ViewRequestsLoaded(requests));
    } catch (e) {
      emit(ViewRequestsError(e.toString()));
    }
  }
}
