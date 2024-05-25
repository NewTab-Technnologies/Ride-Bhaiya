import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ridebhaiya/widgets/form_component.dart';

void main() {
  testWidgets('FormComponent test', (WidgetTester tester) async {
    // Create TextEditingController instances for the test
    final startingPointController = TextEditingController();
    final destinationController = TextEditingController();
    final timeController = TextEditingController();
    final seatingController = TextEditingController();

    // Build the widget tree with FormComponent
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FormComponent(
          startingPointController: startingPointController,
          destinationController: destinationController,
          timeController: timeController,
          seatingController: seatingController,
          formFor: 'Schedule',
        ),
      ),
    ));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FormComponent(
          startingPointController: startingPointController,
          destinationController: destinationController,
          timeController: timeController,
          seatingController: seatingController,
          formFor: 'Request',
        ),
      ),
    ));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FormComponent(
          startingPointController: startingPointController,
          destinationController: destinationController,
          timeController: timeController,
          seatingController: seatingController,
          formFor: 'Request',
        ),
      ),
    ));

    // Verify that the text elements are present
    expect(find.text('Starting Point'), findsOneWidget);
    expect(find.text('Destination'), findsOneWidget);
    expect(find.text('Time'), findsOneWidget);
    expect(find.text('Seating for'), findsOneWidget);
    expect(find.text('Seating Availability'), findsNothing);
    expect(find.text('Seating Availability'), findsNothing);

    // Verify that the icons are present
    expect(find.byIcon(Icons.location_on), findsNWidgets(2));
    expect(find.byIcon(Icons.access_time), findsOneWidget);
    expect(find.byIcon(MdiIcons.carSeat), findsOneWidget);
  });
}
