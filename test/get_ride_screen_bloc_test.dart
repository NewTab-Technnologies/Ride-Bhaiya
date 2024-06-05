import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_bloc.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_event.dart';
import 'package:ridebhaiya/bloc/get_ride_screen/get_ride_screen_state.dart';

void main() {
  late GetRideScreenBloc bloc;

  setUp(() {
    bloc = GetRideScreenBloc();
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is GetRideLoading', () {
    expect(bloc.state, GetRideLoading());
  });

  blocTest<GetRideScreenBloc, GetRideState>(
    'emits [GetRideLoaded] when ViewSchedulesPressed event is added',
    build: () => bloc,
    act: (bloc) => bloc.add(ViewSchedulesPressed()),
    expect: () => [GetRideLoaded()],
  );

  blocTest<GetRideScreenBloc, GetRideState>(
    'emits [GetRideLoaded] when RequestRidePressed event is added',
    build: () => bloc,
    act: (bloc) => bloc.add(RequestRidePressed()),
    expect: () => [GetRideLoaded()],
  );
}
