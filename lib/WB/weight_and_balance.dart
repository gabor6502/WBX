import 'package:flutter/material.dart';
import 'package:wbx/WB/dropdown_editable.dart';
import 'package:wbx/model/wb_types/weight.dart';
import '../model/items/pilot.dart';
import '../model/items/person.dart';

class WeightAndBalance extends StatefulWidget {
  const WeightAndBalance({super.key});

  @override
  State<WeightAndBalance> createState() => _WeightAndBalanceState();
}

class _WeightAndBalanceState extends State<WeightAndBalance> {
  /*List<Plane> emptyStubPlanes = [];
  List<Plane> stubPlanes = [
    Plane("CFLUG", 1039),
    Plane("CFMRG", 1200),
    Plane("CGHEY", 1000),
  ];*/

  List<Pilot> emptyStubPilots = [Pilot("Select a pilot", Weight(0))];
  List<Pilot> stubPilots = [
    Pilot("Iyla <3", Weight(120)),
    Pilot("Amelia", Weight(140)),
    Pilot("Orville", Weight(160)),
    Pilot("Wilbur", Weight(150)),
    Pilot("Billy", Weight(170)),
    Pilot("Sully", Weight(150)),
  ];

  List<Person> emptyStubPassengers = [Person("Select a person", Weight(0))];
  List<Person> stubPassengers = [
    Person.noPassenger,
    Person("Elan", Weight(160)),
    Person("Michael", Weight(150)),
    Person("Hayley", Weight(120)),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CFLUG", style: TextStyle(fontSize: 28)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink.shade700, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 10,
                horizontal: 17,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Front Seat: ", style: TextStyle(fontSize: 20)),
                  DropdownEditable<Pilot>(
                    key: UniqueKey(),
                    list: emptyStubPilots,
                    label: "Pilot",
                  ),
                  DropdownEditable<Person>(
                    key: UniqueKey(),
                    list: emptyStubPassengers,
                    label: "Passenger",
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
