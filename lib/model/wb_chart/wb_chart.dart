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
  static final Arm FUEL_ARM = Arm(41.0);
  static final Weight TAXI_RUNUP_FUEL_BURN = Weight(4.8);

  final Plane plane = Plane("CFLUG", Weight(1039));
  late Moment basicEmptyWeight;

  // front seat
  Pilot pilot;
  Person? passenger;
  Weight? frontSeatBaggage;
  late Moment frontSeat;

  // baggage area
  Weight? baggage; // MAX 80LB
  late Moment baggageArea;

  // fuel
  late Moment zeroFuel;
  Weight fuelLbs; // fuel is 6lbs per gallon
  late Moment plusFuel;
  late Moment takeoff; // taking off from the ground // MAX 1500
  Weight lessBurnFuelLbs; // given by pilot
  late Moment lessBurn; // what you burned while flying and stuff
  late Moment landing;

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

    // arm for zero fuel is sum of all previous moments divided by the zero fuel weight
    Weight zeroFuelWeight =
        basicEmptyWeight.weight + frontSeat.weight + baggageArea.weight;
    zeroFuel = Moment(
      zeroFuelWeight,
      Moment.getArmFrom(
        basicEmptyWeight + frontSeat + baggageArea,
        zeroFuelWeight,
      ),
    );

    plusFuel = Moment(fuelLbs, FUEL_ARM);

    // call this less burn run up
    takeoff = Moment(
      plusFuel.weight + zeroFuel.weight - TAXI_RUNUP_FUEL_BURN,
      FUEL_ARM,
    );

    lessBurn = Moment(lessBurnFuelLbs, FUEL_ARM);

    Weight landingWeight = takeoff.weight - lessBurn.weight;
    landing = Moment(
      landingWeight,
      Moment.getArmFrom(
        basicEmptyWeight +
            frontSeat +
            baggageArea +
            zeroFuel +
            plusFuel +
            takeoff +
            lessBurn,
        landingWeight,
      ),
    );
  }

  WbChart({
    required this.pilot,
    this.passenger,
    this.frontSeatBaggage,
    this.baggage,
    required this.fuelLbs,
    required this.lessBurnFuelLbs,
  }) {
    calculateWB();
  }
}
