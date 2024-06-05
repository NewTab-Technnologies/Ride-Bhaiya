// view_request_bloc_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_bloc.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_event.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_state.dart';

void main() {
  group('ViewRequestsBloc', () {
    late ViewRequestsBloc viewRequestsBloc;

    setUp(() {
      viewRequestsBloc = ViewRequestsBloc();
    });

    tearDown(() {
      viewRequestsBloc.close();
    });

    test('initial state is ViewRequestsLoading', () {
      expect(viewRequestsBloc.state, ViewRequestsLoading());
    });

    blocTest<ViewRequestsBloc, ViewRequestsState>(
      'emits [ViewRequestsLoading, ViewRequestsLoaded] when FetchRequests is added',
      build: () => viewRequestsBloc,
      act: (bloc) => bloc.add(FetchRequests()),
      wait: const Duration(
          seconds: 3), // Add wait to ensure async operations complete
      expect: () => [
        ViewRequestsLoading(),
        ViewRequestsLoaded(const [
          "Venkat Sai",
          "Dayton",
          "Denver Airport",
          "24th April 2024",
          "4:00 AM",
          "2",
          "(+1) 7203000803"
        ]),
      ],
    );

    blocTest<ViewRequestsBloc, ViewRequestsState>(
      'emits [ViewRequestsLoading, ViewRequestsError] when an error occurs',
      build: () => ViewRequestsBloc(),
      act: (bloc) async {
        bloc.emit(ViewRequestsLoading());
        bloc.emit(ViewRequestsError('Error occurred'));
      },
      expect: () => [
        ViewRequestsLoading(),
        ViewRequestsError('Error occurred'),
      ],
    );
  });
}
