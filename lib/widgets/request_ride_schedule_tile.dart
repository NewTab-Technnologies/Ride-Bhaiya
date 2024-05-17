import 'package:flutter/material.dart';

class ScheduleTile extends StatefulWidget 
{
  const ScheduleTile ({super.key});

  @override
  State<ScheduleTile> createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> 
{
  List <String> parameters = ["Name", "From", "To", "Date", "Time", "Seats", "Contact"];
  List <String> values = ["Venkat Sai", "Dayton", "Denver Airport", "24th April 2024", "4:00 AM", "2", "(+1) 7203000803"];

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: const Color.fromRGBO(73, 182, 243, 1.000),
      body: Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          Column
          (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              const SizedBox(height: 173,),
              TileTwoButtons(parameters: parameters, values: values),                                                   
            ],
          ),
        ],
      )
    );
  }
}

class TileTwoButtons extends StatelessWidget 
{
  const TileTwoButtons
  (
    {super.key, required this.parameters, required this.values,}
  );

  final List<String> parameters;
  final List<String> values;

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: BoxDecoration
      (
        color: const Color.fromRGBO(255, 255, 255, 1.000),
        borderRadius: BorderRadius.circular(28.0),
      ),
      
      height: 328.0, width: 326.0,
      child: Column
      (
        children: 
        [
          Padding
          (
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>
              [
                Column
                (
                  children: parameters.map((p)
                  {
                    return 
                    Padding
                    (
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text
                      (
                        p,
                        style: const TextStyle
                        (
                          color: Color.fromRGBO(73,182,243, 1.000),
                          fontFamily: "Poppins",
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Column
                (
                  children: values.map((v)
                  {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text
                      (
                        v,
                        style: const TextStyle
                        (
                          color: Color.fromRGBO(73,182,243, 1.000),
                          fontFamily: "Poppins",
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          TextButton
          (
            key: const Key("contactButton"),
            onPressed:(){}, 
            style: const ButtonStyle
            (
              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(73,182,243, 1.000)),
              fixedSize: MaterialStatePropertyAll(Size(164.1, 32.63),),
            ),
            child: const Text
            (
              "Contact",
              style: TextStyle
              (
                color: Color.fromRGBO(255, 255, 255, 1.000),
                fontFamily: "Poppins",
              ),
            ),
          ),
          const SizedBox(height: 9.74),
          TextButton
          (
            key: const Key("viewMoreButton"),
            onPressed: () {},
            style: ButtonStyle
            (
              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(73,182,243, 1.000),),
              fixedSize: MaterialStateProperty.all(const Size(164.1, 32.63)),
            ),
            child: const Text
            (
              "View More",
              style: TextStyle
              (
                color: Color.fromRGBO(255,255,255,1.000),
                fontFamily: "Poppins",
              ),
            ),
          ),
        ],
      ),
    );
  }
}