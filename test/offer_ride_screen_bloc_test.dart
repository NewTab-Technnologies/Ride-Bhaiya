import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_bloc.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_event.dart';
import 'package:ridebhaiya/bloc/offer_ride_screen/offer_ride_screen_state.dart';

void main() {
  late OfferRideScreenBloc bloc;

  setUp(() {
    bloc = OfferRideScreenBloc();
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is InitialOfferState', () {
    expect(bloc.state, InitialOfferState());
  });

  blocTest<OfferRideScreenBloc, OfferRideScreenState>(
    'emits [NavigatedToScheduleRide] when ScheduleRide event is added',
    build: () => bloc,
    act: (bloc) => bloc.add(ScheduleRide()),
    expect: () => [NavigatedToScheduleRide()],
  );

  blocTest<OfferRideScreenBloc, OfferRideScreenState>(
    'emits [NavigatedToViewRequests] when ViewRequests event is added',
    build: () => bloc,
    act: (bloc) => bloc.add(ViewRequests()),
    expect: () => [NavigatedToViewRequests()],
  );
}
