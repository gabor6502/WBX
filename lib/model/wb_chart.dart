import 'package:wbx/model/moment.dart';
import 'package:wbx/model/items/person.dart';
import 'package:wbx/model/items/pilot.dart';
import 'package:wbx/model/items/plane.dart';

class WbChart {
  final Plane CFLUG = Plane("CFLUG", 1039); // MB99s specific plane
  Pilot pilot;
  Person? passenger;

  Moment? BEW;
  Moment? frontSeat;
  Moment? baggage;

  WbChart(this.pilot, this.passenger);
}
