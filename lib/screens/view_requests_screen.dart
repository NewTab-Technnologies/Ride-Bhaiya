import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_bloc.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_event.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_state.dart';
import 'package:ridebhaiya/widgets/request_ride_schedule_tile.dart';

class ViewRequestsScreen extends StatefulWidget {
  const ViewRequestsScreen({super.key});

  @override
  State<ViewRequestsScreen> createState() => _ViewRequestsScreenState();
}

class _ViewRequestsScreenState extends State<ViewRequestsScreen> {
  late final ViewRequestsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ViewRequestsBloc();
    _bloc.add(FetchRequests());
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
              BlocBuilder<ViewRequestsBloc, ViewRequestsState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is ViewRequestsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ViewRequestsLoaded) {
                    return SizedBox(
                      height: height * 0.69,
                      child: SingleChildScrollView(
                        child: Column(
                          //remove take(2) from the code to have 7 requests
                          children: state.requests.take(2).map((request) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: height * 0.02),
                              child: RequestTile(values: state.requests),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  } else if (state is ViewRequestsError) {
                    return Text(state.error);
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
      child: RideDetailsTile(values: widget.values, flag: false),
    );
  }
}
