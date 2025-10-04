import 'package:flutter/material.dart';
import 'package:wbx/WB/dropdown_editable.dart';
import '../model/pilot.dart';
import '../model/person.dart';

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

  List<Pilot> emptyStubPilots = [Pilot("Select a pilot", 0)];
  List<Pilot> stubPilots = [
    Pilot("Iyla <3", 120),
    Pilot("Amelia", 140),
    Pilot("Orville", 160),
    Pilot("Wilbur", 150),
    Pilot("Billy", 170),
    Pilot("Sully", 150),
  ];

  List<Person> emptyStubPassengers = [Person("Select a person", 0)];
  List<Person> stubPassengers = [
    Person.noPassenger,
    Person("Elan", 160),
    Person("Michael", 150),
    Person("Hayley", 120),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*
          DropdownEditable<Plane>(
            key: UniqueKey(),
            list: stubPlanes,
            label: "Plane",
          ),*/
          Text("CFLUG", style: TextStyle(fontSize: 28)),
          DropdownEditable<Pilot>(
            key: UniqueKey(),
            list: emptyStubPilots,
            label: "Pilot in Command",
          ),
          DropdownEditable<Person>(
            key: UniqueKey(),
            list: emptyStubPassengers,
            label: "Passenger",
          ),
        ],
      ),
    );
  }
}
