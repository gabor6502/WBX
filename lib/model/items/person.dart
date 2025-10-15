import 'package:wbx/model/wb_types/weight.dart';

import 'item.dart';

class Person extends Item {
  static Person noPassenger = Person("No passenger", Weight(0.0));

  Person(super.name, super.weight);
}
