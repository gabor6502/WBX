import 'item.dart';

class Person extends Item {
  static Person nullPassenger = Person("No passenger", 0);

  Person(super.name, super.weight);
}
