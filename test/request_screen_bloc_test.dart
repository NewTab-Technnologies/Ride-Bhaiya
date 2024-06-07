// test/bloc/request_screen/request_screen_bloc_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_bloc.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_event.dart';
import 'package:ridebhaiya/bloc/request_screen/request_screen_state.dart';
import 'package:ridebhaiya/bloc/schedule_screen/schedule_repositary.dart';

// Manual mock class for ScheduleRepository
class MockScheduleRepository extends ScheduleRepository {
  bool shouldThrow = false;

  @override
  Future<void> submitFormData(String startingPoint, String destination,
      String time, String seating) async {
    if (shouldThrow) {
      throw Exception('error');
    }
    await Future.delayed(
        const Duration(milliseconds: 100)); // Simulate network delay
  }
}

void main() {
  group('RequestRideBloc', () {
    late RequestRideBloc requestRideBloc;
    late MockScheduleRepository mockScheduleRepository;

    setUp(() {
      mockScheduleRepository = MockScheduleRepository();
      requestRideBloc =
          RequestRideBloc(scheduleRepository: mockScheduleRepository);
    });

    tearDown(() {
      requestRideBloc.close();
    });

    test('initial state is RequestRideInitial', () {
      expect(requestRideBloc.state, equals(RequestRideInitial()));
    });

    blocTest<RequestRideBloc, RequestRideState>(
      'emits [RequestRideLoading, RequestRideSuccess] when ride request succeeds',
      build: () {
        mockScheduleRepository.shouldThrow = false;
        return requestRideBloc;
      },
      act: (bloc) => bloc.add(const RequestRideButtonPressed(
        startingPoint: 'Start',
        destination: 'Destination',
        time: '10:00 AM',
        seating: '4',
      )),
      wait: const Duration(milliseconds: 150), // Wait for the delayed response
      expect: () => [
        RequestRideLoading(),
        RequestRideSuccess(),
      ],
    );

    blocTest<RequestRideBloc, RequestRideState>(
      'emits [RequestRideLoading, RequestRideFailure] when ride request fails',
      build: () {
        mockScheduleRepository.shouldThrow = true;
        return requestRideBloc;
      },
      act: (bloc) => bloc.add(const RequestRideButtonPressed(
        startingPoint: 'Start',
        destination: 'Destination',
        time: '10:00 AM',
        seating: '4',
      )),
      wait: const Duration(milliseconds: 150), // Wait for the delayed response
      expect: () => [
        RequestRideLoading(),
        const RequestRideFailure(error: 'Exception: error'),
      ],
    );
  });
}
