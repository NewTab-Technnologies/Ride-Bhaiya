import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_bloc.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_event.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_state.dart';

void main() {
  group('GetRideScreenBloc', () {
    late GetRideScreenBloc getRideScreenBloc;

    setUp(() {
      getRideScreenBloc = GetRideScreenBloc();
    });

    tearDown(() {
      getRideScreenBloc.close();
    });

    test('initial state is GetRideInitial', () {
      expect(getRideScreenBloc.state, equals(GetRideInitial()));
    });

    blocTest<GetRideScreenBloc, GetRideState>(
      'emits [GetRideLoading, GetRideLoaded] when ViewSchedulesPressed is added',
      build: () => getRideScreenBloc,
      act: (bloc) => bloc.add(ViewSchedulesPressed()),
      wait: const Duration(seconds: 1),
      expect: () => [
        GetRideLoading(),
        GetRideLoaded(),
      ],
    );

    blocTest<GetRideScreenBloc, GetRideState>(
      'emits [GetRideLoading, GetRideLoaded] when RequestRidePressed is added',
      build: () => getRideScreenBloc,
      act: (bloc) => bloc.add(RequestRidePressed()),
      wait: const Duration(seconds: 1),
      expect: () => [
        GetRideLoading(),
        GetRideLoaded(),
      ],
    );
  });
}
