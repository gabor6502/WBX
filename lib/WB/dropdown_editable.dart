import 'package:flutter/material.dart';
import 'package:wbx/WB/wb_text_entries.dart';
import 'package:wbx/model/items/item.dart';

enum Operation { select, edit, add }

class DropdownEditable<T extends Item> extends StatefulWidget {
  final List<T> list;
  final String label;

  const DropdownEditable({super.key, required this.list, required this.label});

  @override
  State<DropdownEditable> createState() => _DropdownEditableState<T>();
}

class _DropdownEditableState<T extends Item> extends State<DropdownEditable> {
  Operation currOpp = Operation.select;
  Item? selected;

  // based on current operation, edit or add some data point for weight and balance
  editOrAdd() {
    if (currOpp == Operation.add) {
      return WbTextEntries(
        key: UniqueKey(),
        onComplete: () {
          setState(() {
            currOpp = Operation.select;
          });
        },
      );
    } else if (currOpp == Operation.edit) {
      return WbTextEntries(
        key: UniqueKey(),
        onComplete: () {
          setState(() {
            currOpp = Operation.select;
          });
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              DropdownMenu<Item>(
                requestFocusOnTap: true,
                label: Text(widget.label),
                dropdownMenuEntries: widget.list.asMap().entries.map((entry) {
                  return DropdownMenuEntry<Item>(
                    value: entry.value,
                    label: entry.value.name,
                    enabled:
                        entry.value.weight >
                        0, // case for default "select item"
                  );
                }).toList(),
                enabled: currOpp == Operation.select,
                onSelected: (value) {
                  setState(() {
                    value!.weight > 0 ? selected = value : selected = null;
                  });
                },
              ),
              IconButton(
                onPressed: currOpp == Operation.select
                    ? () {
                        setState(() {
                          currOpp = Operation.add;
                        });
                      }
                    : null,
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: (currOpp == Operation.select && selected != null)
                    ? () {
                        setState(() {
                          currOpp = Operation.edit;
                        });
                      }
                    : null,
                icon: Icon(Icons.edit),
              ),
            ],
          ),
          editOrAdd(),
        ],
      ),
    );
  }
}
