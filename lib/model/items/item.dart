import 'package:wbx/model/wb_types/weight.dart';

abstract class Item {
  String name;
  Weight weight;

  Item(this.name, this.weight);
}
