import 'package:flutter/material.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_bloc.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_event.dart';
import 'package:ridebhaiya/bloc/view_schedules/view_schedules_state.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

class ViewScheduleScreen extends StatefulWidget {
  const ViewScheduleScreen({super.key});

  @override
  State<ViewScheduleScreen> createState() => _ViewScheduleScreenState();
}

class _ViewScheduleScreenState extends State<ViewScheduleScreen> {
  late final ViewScheduleBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ViewScheduleBloc();
    _bloc.add(FetchSchedules());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(73, 182, 243, 1.000),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(73, 182, 243, 1.000),
        title: const SafeArea(
          child: Text(
            "RIDE BHAIYA",
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1.000),
              fontFamily: "Poppins",
              fontSize: 31,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                "View Schedules",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1.000),
                  fontFamily: "Poppins",
                  fontSize: 31,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              StreamBuilder<ViewScheduleState>(
                stream: _bloc.stateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final state = snapshot.data!;
                    if (state is ViewScheduleLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is ViewScheduleLoaded) {
                      return SizedBox(
                        height: height * 0.69,
                        child: SingleChildScrollView(
                          child: Column(
                            children: state.schedules.map((schedule) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: height * 0.02),
                                child: ScheduleTile(values: state.schedules),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    } else if (state is ViewScheduleError) {
                      return Text(state.error);
                    }
                  }
                  return Container(); // Placeholder
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleTile extends StatefulWidget {
  const ScheduleTile({super.key, required this.values});
  final List<String> values;

  @override
  State<ScheduleTile> createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.325,
      width: width * 0.95,
      margin: const EdgeInsets.symmetric(horizontal: 7.0),
      child: RideDetailsTile(values: widget.values, flag: false),
    );
  }
}
