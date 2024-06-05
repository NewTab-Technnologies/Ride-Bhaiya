class ScheduleRepository {
  Future<void> submitFormData(String startingPoint, String destination,
      String time, String seating) async {
    await Future.delayed(const Duration(seconds: 2));
    //print(
    //    'Starting point: $startingPoint, Destination: $destination, Time: $time,Seating: $seating');
  }
}
