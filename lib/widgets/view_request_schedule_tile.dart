import 'package:flutter/material.dart';

class RequestScheduleTile extends StatefulWidget {
  const RequestScheduleTile({
    super.key,
    required this.values,
  });
  final List<String> values;

  @override
  State<RequestScheduleTile> createState() => _RequestScheduleTileState();
}

class _RequestScheduleTileState extends State<RequestScheduleTile> {
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
      height: height * 0.35,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1.000),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: parameters.map((p) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          p,
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
                    children: widget.values.map((v) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          v,
                          style: TextStyle(
                              color: const Color.fromRGBO(73, 182, 243, 1.000),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.018),
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
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
