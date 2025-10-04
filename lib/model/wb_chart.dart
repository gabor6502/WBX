import 'package:wbx/model/moment.dart';
import 'package:wbx/model/items/person.dart';
import 'package:wbx/model/items/pilot.dart';
import 'package:wbx/model/items/plane.dart';

class WbChart {
  // arms specific to CFLUG
  static const double BEW_ARM = 34.35;
  static const double FRONT_SEAT_ARM = 39.0;

  final Plane CFLUG = Plane("CFLUG", 1039); // MB99s specific plane
  Pilot pilot;
  Person? passenger;

  late Moment BEW;
  late Moment frontSeat;
  Moment? baggage;

  Moment? zeroFuel;
  Moment? plusFuel;
  Moment? takeoff;
  Moment? lessBurn;
  Moment? landing;

  WbChart(this.pilot, this.passenger) {
    BEW = Moment(CFLUG.weight.toDouble(), BEW_ARM);

    passenger ??= Person.noPassenger;

    frontSeat = Moment(
      pilot.weight.toDouble() + passenger!.weight.toDouble(),
      FRONT_SEAT_ARM,
    );
  }
}
