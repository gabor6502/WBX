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
  static final Arm BAGGAGE_AREA_ARM = Arm(65.0);

  final Plane plane = Plane("CFLUG", Weight(1039)); // MB99s specific plane
  late Moment basicEmptyWeight;

  // front seat
  Pilot pilot;
  Person? passenger;
  Weight? frontSeatBaggage;
  late Moment frontSeat;

  // baggage area
  Weight? baggage;
  late Moment baggageArea;

  // fuel
  late Moment zeroFuel;
  Moment? plusFuel;
  Moment? takeoff;
  Moment? lessBurn;
  Moment? landing;

  void calculateWB() {
    basicEmptyWeight = Moment(plane.weight, BEW_ARM);

    passenger ??= Person.noPassenger;

    frontSeat = Moment(
      pilot.weight + passenger?.weight + frontSeatBaggage,
      FRONT_SEAT_ARM,
    );

    baggage == null
        ? baggageArea = Moment(Weight(0), BAGGAGE_AREA_ARM)
        : Moment(baggage!, BAGGAGE_AREA_ARM);

    /*
    zeroFuel = Moment(
      basicEmptyWeight.weight + frontSeat.weight + baggageArea.weight,
    );*/
  }

  WbChart({
    required this.pilot,
    this.passenger,
    this.frontSeatBaggage,
    this.baggage,
  }) {
    calculateWB();
  }
}
