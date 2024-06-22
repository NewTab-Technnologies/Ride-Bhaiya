import 'package:bloc/bloc.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_sceen_tab_structure_event.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ridebhaiya/models/schedule_model.dart';
import 'package:ridebhaiya/screens/home_screen_tab_structure.dart';

class RideDetailsBloc extends Bloc<RideDetailsEvent, RideDetailsState> {
  final String? testErrorMessage;

  RideDetailsBloc({this.testErrorMessage}) : super(RideDetailsInitial()) {
    on<FetchRideDetails>(_onFetchRideDetails);
  }

  void _onFetchRideDetails(
      FetchRideDetails event, Emitter<RideDetailsState> emit) async {
    emit(RideDetailsLoading());

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      if (testErrorMessage != null) {
        throw Exception(testErrorMessage);
      }

      DocumentSnapshot phone = await FirebaseFirestore.instance
          .collection('user')
          .doc(
              'MwwkLsi06OM9TojOt7hVxdf9NPf1') //This will be changed to (OTPVerification.uid) a static variable afetr completing authentication
          .get();
      Map<String, dynamic> data = phone.data() as Map<String, dynamic>;
      HomeScreen.number = data['phone'] as String;

      ScheduleModel scheduleDetails = ScheduleModel();
      // Fetch schedule details from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('schedules')
          .orderBy('scheduleDates', descending: true)
          .limit(1)
          .get();
      var rawData = querySnapshot.docs.first.data();
      if (rawData == null) {
        throw Exception('Schedule data is null.');
      }

      Map<String, dynamic> ridedata = rawData as Map<String, dynamic>;
      if (ridedata.isEmpty) {
        throw Exception('Schedule data is empty.');
      }
      //fetch requests in the same way

      // Parse data into ScheduleModel
      scheduleDetails = ScheduleModel.fromJson(
          ridedata); //Parse the data into RequestModel in the same way
      emit(RideDetailsLoaded(scheduleDetails));
    } catch (e) {
      emit(RideDetailsError(e.toString()));
    }
  }

  void fetchRideDetails() {
    add(FetchRideDetails());
  }
}
