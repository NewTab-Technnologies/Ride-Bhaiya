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
      backgroundColor: const Color.fromRGBO(73,182,243, 1.000),
      body: Stack
      (
        children:
        [
          Positioned
          (
            top: 173,
            left: 13,
            child: SizedBox
            (
              width: 334.0,
              height: 364.0,
              child: Card
              (
                elevation: 0.0,
                color: const Color.fromRGBO(255,255,255,1.000),
                child: Padding
                (
                  padding: const EdgeInsets.fromLTRB(34.67, 20.39, 35.66, 19.37),
                  child: Column
                  (
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>
                    [
                      Row
                      (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>
                        [
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: parameters.map((p)
                            {
                              return Padding
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
                                )
                              );
                            }).toList(),
                          ),
                          const SizedBox(width: 60.6,),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Column(
                                children: values.map((v)
                                {
                                  return Padding
                                  (
                                    padding: const EdgeInsets.only(bottom: 6.0),
                                    child: Text
                                    (
                                      v,
                                      style: const TextStyle
                                      (
                                        color: Color.fromRGBO(73,182,243, 1.000),
                                        fontFamily: "Poppins",
                                      )
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 27),
                      Column
                      (
                        children: <Widget>
                        [
                          TextButton
                          (
                            onPressed: () {},
                            style: ButtonStyle
                            (
                              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(73,182,243, 1.000),),
                              fixedSize: MaterialStateProperty.all(const Size(164.1, 32.63)),
                            ),
                            child: const Text
                            (
                              "Contact",
                              style: TextStyle
                              (
                                color: Color.fromRGBO(255,255,255,1.000),
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                          const SizedBox(height: 9.74),
                          
                          TextButton
                          (
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}