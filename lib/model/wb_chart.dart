import 'package:wbx/model/moment.dart';
import 'package:wbx/model/items/person.dart';
import 'package:wbx/model/items/pilot.dart';
import 'package:wbx/model/items/plane.dart';

class WbChart {
  // arms specific to CFLUG
  static const double BEW_ARM = 34.35;
  static const double FRONT_SEAT_ARM = 39.0;

  final Plane plane = Plane("CFLUG", 1039); // MB99s specific plane
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
    basicEmptyWeight = Moment(plane.weight.toDouble(), BEW_ARM);

    passenger ??= Person.noPassenger;

    frontSeat = Moment(
      pilot.weight.toDouble() + passenger!.weight.toDouble(),
      FRONT_SEAT_ARM,
    );
  }

  WbChart(this.pilot, this.passenger) {
    calculateWB();
  }
}
