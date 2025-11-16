import 'package:wbx/model/items/item.dart';
import 'package:wbx/model/wb_types/weight.dart';

abstract class ItemListEvent {
  final Item item;

  ItemListEvent(this.item);
}

class AddToList extends ItemListEvent {
  AddToList(super.item);
}

class RemoveFromList extends ItemListEvent {
  RemoveFromList(super.item);
}

class RenameItem extends ItemListEvent {
  final String newName;

  RenameItem(this.newName, super.item);
}

class ReweighItem extends ItemListEvent {
  final Weight newWeight;

  ReweighItem(this.newWeight, super.item);
}
