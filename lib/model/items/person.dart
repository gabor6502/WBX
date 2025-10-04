import 'item.dart';

class Person extends Item {
  static Person noPassenger = Person("No passenger", 0);

  Person(super.name, super.weight);
}
