import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FormComponent extends StatefulWidget {
  const FormComponent(
      {super.key,
      required this.startingPointController,
      required this.destinationController,
      required this.timeController,
      required this.seatingController,
      required this.formFor});

  final TextEditingController startingPointController;
  final TextEditingController destinationController;
  final TextEditingController timeController;
  final TextEditingController seatingController;
  final String formFor;

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          buildLabelText('Starting Point'),
          buildTextFormField(
              controller: widget.startingPointController,
              suffixIcon: Icons.location_on),
          const SizedBox(height: 16),
          buildLabelText('Destination'),
          buildTextFormField(
              controller: widget.destinationController,
              suffixIcon: Icons.location_on),
          const SizedBox(height: 16),
          buildLabelText('Time'),
          buildTextFormField(
              controller: widget.timeController, suffixIcon: Icons.access_time),
          const SizedBox(height: 16),
          buildLabelText(widget.formFor == 'Schedule'
              ? 'Seating Availability'
              : 'Seating for'),
          buildTextFormField(
              controller: widget.seatingController,
              suffixIcon: MdiIcons.carSeat),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget buildLabelText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      {required TextEditingController controller,
      required IconData suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(suffixIcon, color: Colors.white),
          hintText: '',
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
