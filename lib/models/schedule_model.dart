import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ScheduleModel {
  String? destination;
  String? requestedBy;
  DateTime? scheduleDates;
  String? scheduleTime;
  int? seatingFor;
  String? startingPoint;

  ScheduleModel(
      {this.destination,
      this.requestedBy,
      this.scheduleDates,
      this.scheduleTime,
      this.seatingFor,
      this.startingPoint});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    destination = json['destination'];
    requestedBy = json['requestedBy'];
    scheduleDates = (json['scheduleDates'] as Timestamp).toDate();
    scheduleTime = json['scheduleTime'];
    seatingFor = json['seatingFor'];
    startingPoint = json['startingPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination'] = destination;
    data['requestedBy'] = requestedBy;
    final dateFormat = DateFormat('MM/dd/yyyy');
    data['scheduleDates'] = dateFormat.format(scheduleDates!);
    // scheduleDates!.toIso8601String().split('T').first;
    data['scheduleTime'] = scheduleTime;
    data['seatingFor'] = seatingFor;
    data['startingPoint'] = startingPoint;
    return data;
  }
}
