import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wbx/bloc/list/item_list_event.dart';
import 'package:wbx/bloc/list/item_list_state.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemList> {
  ItemListBloc() : super(ItemList([])) {
    on<AddToList>((event, emit) {
      state.items.add(event.item);
      emit(ItemList(state.items));
    });
    on<RemoveFromList>((event, emit) {
      state.items.remove(event.item);
      emit(ItemList(state.items));
    });
    /*

   need to cast or tweak event

    on<RenameItem>((event, emit) {
      state.items.firstWhere((item) => item.name == event.item.name).name =
          ((RenameItem)(event)).name; 
    });
    on<ReweighItem>((event, emit) {});
    */
  }
}
