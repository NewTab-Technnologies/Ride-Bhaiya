import 'package:flutter/material.dart';

class TileTwoButtons extends StatefulWidget {
  const TileTwoButtons({
    super.key,
    required this.values,
  });
  final List<String> values;

  @override
  State<TileTwoButtons> createState() => _TileTwoButtonsState();
}

class _TileTwoButtonsState extends State<TileTwoButtons> {
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
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: parameters.map((p) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          p,
                          style: const TextStyle(
                            color: Color.fromRGBO(73, 182, 243, 1.000),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
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
                          style: const TextStyle(
                            color: Color.fromRGBO(73, 182, 243, 1.000),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            TextButton(
              key: const Key("contactButton"),
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(73, 182, 243, 1.000),
                fixedSize: const Size(164.1, 32.63),
              ),
              child: const Text(
                "Contact",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1.000),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            TextButton(
              key: const Key("viewMoreButton"),
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(73, 182, 243, 1.000),
                fixedSize: const Size(164.1, 32.63),
              ),
              child: const Text(
                "View More",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1.000),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
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
