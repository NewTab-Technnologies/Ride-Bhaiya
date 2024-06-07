import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_bloc.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_state.dart';

void main() {
  group('RideDetailsBloc', () {
    late RideDetailsBloc rideDetailsBloc;

    setUp(() {
      rideDetailsBloc = RideDetailsBloc();
    });

    tearDown(() {
      rideDetailsBloc.close();
    });

    test('initial state is RideDetailsInitial', () {
      expect(rideDetailsBloc.state, RideDetailsInitial());
    });

    blocTest<RideDetailsBloc, RideDetailsState>(
      'emits [RideDetailsLoading, RideDetailsLoaded] when FetchRideDetails is added and succeeds',
      build: () => rideDetailsBloc,
      act: (bloc) => bloc.fetchRideDetails(),
      wait: const Duration(seconds: 3),
      expect: () => [
        RideDetailsLoading(),
        isA<RideDetailsLoaded>(),
      ],
    );

    blocTest<RideDetailsBloc, RideDetailsState>(
      'emits [RideDetailsLoading, RideDetailsError] when FetchRideDetails is added and fails',
      build: () =>
          RideDetailsBloc(testErrorMessage: 'Failed to fetch ride details'),
      act: (bloc) => bloc.fetchRideDetails(),
      wait: const Duration(seconds: 3),
      expect: () => [
        RideDetailsLoading(),
        const RideDetailsError('Exception: Failed to fetch ride details'),
      ],
    );
  });
}
