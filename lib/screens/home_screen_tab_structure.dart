import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> homeTabs = ['Latest Schedules', 'Latest Requests'];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: homeTabs.length,
      child: Scaffold(
          backgroundColor: const Color(0xff49B6F3),
          appBar: AppBar(
            backgroundColor: const Color(0xff49B6F3),
            title: const Center(
              child: SafeArea(
                child: Text(
                  'RIDE BHAIYA',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.08),
              child: Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: height * 0.03),
                decoration: BoxDecoration(
                  color: const Color(0xff49B6F3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelColor: const Color(0xff49B6F3),
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                  tabs: homeTabs.map((tab) => Tab(text: tab)).toList(),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: height * 0.43,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const TabBarView(children: [
                  ScheduleTile(),
                  RequestTile(),
                ]),
              ),
              SizedBox(height: height * 0.03),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
                    const Text(
                      'Offer a Ride',
                      style: TextStyle(
                          color: Color(0xff49B6F3),
                          fontFamily: 'Poppins',
                          fontSize: 23),
                    ),
                    SizedBox(
                      width: width * 0.09,
                    ),
                    const Iconify(
                      Mdi.car_hatchback,
                      color: Color(0xff49B6F3),
                      size: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    const Text(
                      'Get a Ride',
                      style: TextStyle(
                          color: Color(0xff49B6F3),
                          fontFamily: 'Poppins',
                          fontSize: 23),
                    ),
                    SizedBox(
                      width: width * 0.09,
                    ),
                    const Icon(
                      Icons.airline_seat_recline_normal_rounded,
                      color: Color(0xff49B6F3),
                      size: 50,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class ScheduleTile extends StatelessWidget {
  const ScheduleTile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.05,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(
          child: Text(
        'Schedule Tile',
        style: TextStyle(fontFamily: 'Poppins', fontSize: 30),
      )),
    );
  }
}

class RequestTile extends StatelessWidget {
  const RequestTile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(
          child: Text(
        'Requests Tile',
        style: TextStyle(fontFamily: 'Poppins', fontSize: 30),
      )),
    );
  }
}