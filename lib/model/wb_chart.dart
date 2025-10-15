import 'package:wbx/model/wb_types/arm.dart';
import 'package:wbx/model/wb_types/moment.dart';
import 'package:wbx/model/items/person.dart';
import 'package:wbx/model/items/pilot.dart';
import 'package:wbx/model/items/plane.dart';
import 'package:wbx/model/wb_types/weight.dart';

class WbChart {
  // arms specific to CFLUG
  static final Arm BEW_ARM = Arm(34.35);
  static final Arm FRONT_SEAT_ARM = Arm(39.0);

  final Plane plane = Plane("CFLUG", Weight(1039)); // MB99s specific plane
  Pilot pilot;
  Person? passenger;

  late Moment basicEmptyWeight;
  late Moment frontSeat;
  Moment? baggage;

  Moment? zeroFuel;
  Moment? plusFuel;
  Moment? takeoff;
  Moment? lessBurn;
  Moment? landing;

  void calculateWB() {
    basicEmptyWeight = Moment(plane.weight, BEW_ARM);

    passenger ??= Person.noPassenger;

    frontSeat = Moment(pilot.weight + passenger?.weight, FRONT_SEAT_ARM);
  }

  WbChart(this.pilot, this.passenger) {
    calculateWB();
  }
}
