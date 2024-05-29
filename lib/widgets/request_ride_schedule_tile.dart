import 'package:flutter/material.dart';
import 'package:ridebhaiya/screens/view_requests_screen.dart';
import 'package:ridebhaiya/screens/view_schedule_screen.dart';

class RideDetailsTile extends StatefulWidget {
  const RideDetailsTile({
    super.key,
    required this.values,
    this.flag = true,
    this.path = 'one',
  });
  final List<String> values;
  final dynamic flag;
  final String path;

  @override
  State<RideDetailsTile> createState() => _RideDetailsTileState();
}

class _RideDetailsTileState extends State<RideDetailsTile> {
  List<String> parameters = [
    "Name",
    "From",
    "To",
    "Date",
    "Time",
    "Seats",
    "Contact"
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1.000),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: parameters.map((para) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.007),
                        child: Text(
                          para,
                          style: TextStyle(
                            color: const Color.fromRGBO(73, 182, 243, 1.000),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.018,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: widget.values.map((val) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.007),
                        child: Text(
                          val,
                          style: TextStyle(
                            color: const Color.fromRGBO(73, 182, 243, 1.000),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.018,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            TextButton(
              key: const Key("contactButton"),
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(73, 182, 243, 1.000),
                fixedSize: const Size(164.1, 32.63),
              ),
              child: Text(
                "Contact",
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1.000),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.018,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            if (widget.flag)
              TextButton(
                key: const Key("viewMoreButton"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.path == 'one'
                          ? const ViewRequestsScreen()
                          : const ViewScheduleScreen()),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(73, 182, 243, 1.000),
                  fixedSize: const Size(164.1, 32.63),
                ),
                child: Text(
                  "View More",
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1.000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }
}
