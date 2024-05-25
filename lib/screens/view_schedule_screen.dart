import "package:flutter/material.dart";
import "package:ridebhaiya/widgets/view_request_schedule_tile.dart";

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<String> values = [
    "Venkat Sai",
    "Dayton",
    "Denver Airport",
    "24th April 2024",
    "4:00 AM",
    "2",
    "(+1) 7203000803"
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.05,
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
                  height: height * 0.07,
                ),
                Container(
                    height: height * 0.325,
                    width: width * 0.95,
                    margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ScheduleOneTile(values: values)),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                    height: height * 0.325,
                    width: width * 0.95,
                    margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ScheduleTwoTile(values: values)),
              ],
            ),
          ],
        ));
  }
}

class ScheduleOneTile extends StatefulWidget {
  const ScheduleOneTile({super.key, required this.values});
  final List<String> values;

  @override
  State<ScheduleOneTile> createState() => _ScheduleOneTileState();
}

class _ScheduleOneTileState extends State<ScheduleOneTile> {
  @override
  Widget build(BuildContext context) {
    return RequestScheduleTile(values: widget.values);
  }
}

class ScheduleTwoTile extends StatefulWidget {
  const ScheduleTwoTile({super.key, required this.values});
  final List<String> values;

  @override
  State<ScheduleTwoTile> createState() => _ScheduleTwoTileState();
}

class _ScheduleTwoTileState extends State<ScheduleTwoTile> {
  @override
  Widget build(BuildContext context) {
    return RequestScheduleTile(values: widget.values);
  }
}
