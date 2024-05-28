import "package:flutter/material.dart";
import "package:ridebhaiya/widgets/request_ride_schedule_tile.dart";

class ViewRequestsScreen extends StatefulWidget {
  const ViewRequestsScreen({super.key});
  @override
  State<ViewRequestsScreen> createState() => _ViewRequestsScreenState();
}

class _ViewRequestsScreenState extends State<ViewRequestsScreen> {
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
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                const Text(
                  "View Requests",
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
                SizedBox(
                  height: height * 0.69,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      values,
                      values,
                    ].map((schedule) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.02),
                        child: RequestTile(values: values),
                      );
                    }).toList(),
                  )),
                ),
              ],
            ),
          ],
        ));
  }
}

class RequestTile extends StatefulWidget {
  const RequestTile({super.key, required this.values});
  final List<String> values;

  @override
  State<RequestTile> createState() => _RequestTileState();
}

class _RequestTileState extends State<RequestTile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.325,
        width: width * 0.95,
        margin: const EdgeInsets.symmetric(horizontal: 7.0),
        child: RideDetailsTile(values: widget.values, flag: false));
  }
}
