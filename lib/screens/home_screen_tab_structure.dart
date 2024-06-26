import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_bloc.dart';
import 'package:ridebhaiya/bloc/home_screen_tab_structure/home_screen_tab_structure_state.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';
import 'get_ride_screen.dart';
import 'offer_ride_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RideDetailsBloc _rideDetailsBloc = RideDetailsBloc();
  List<String> homeTabs = ['Latest Schedules', 'Latest Requests'];

  @override
  void initState() {
    super.initState();
    _rideDetailsBloc.fetchRideDetails();
  }

  @override
  void dispose() {
    _rideDetailsBloc.close();
    super.dispose();
  }

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
            preferredSize: Size.fromHeight(height * 0.1),
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
              height: height * 0.39,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<RideDetailsState>(
                stream: _rideDetailsBloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final state = snapshot.data!;
                    if (state is RideDetailsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is RideDetailsLoaded) {
                      return TabBarView(
                        children: [
                          ScheduleTile(values: state.rideDetails),
                          RequestTile(values: state.rideDetails),
                        ],
                      );
                    } else if (state is RideDetailsError) {
                      return Center(child: Text(state.errorMessage));
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(height: height * 0.08),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OfferRideScreen()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1.000),
                elevation: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: width * 0.01),
                  const Text(
                    'Offer a Ride',
                    style: TextStyle(
                      color: Color(0xff49B6F3),
                      fontFamily: 'Poppins',
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(width: width * 0.09),
                  const Iconify(
                    Mdi.car_hatchback,
                    color: Color(0xff49B6F3),
                    size: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GetRideScreen()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1.000),
                elevation: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'Get a Ride',
                    style: TextStyle(
                      color: Color(0xff49B6F3),
                      fontFamily: 'Poppins',
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(width: width * 0.09),
                  const Icon(
                    Icons.airline_seat_recline_normal_rounded,
                    color: Color(0xff49B6F3),
                    size: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
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
    return RideDetailsTile(
      values: widget.values,
      path: 'two',
    );
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
    return RideDetailsTile(
      values: widget.values,
      path: 'one',
    );
  }
}
