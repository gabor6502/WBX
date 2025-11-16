import 'package:flutter/material.dart';
import 'package:wbx/WB/name_weight_entries.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownMenu<Item>(
                requestFocusOnTap: true,
                label: Text(widget.label),
                dropdownMenuEntries: widget.list.asMap().entries.map((entry) {
                  return DropdownMenuEntry<Item>(
                    value: entry.value,
                    label: entry.value.name,
                    enabled:
                        entry.value.weight.weight >
                        0, // case for default "select item"
                  );
                }).toList(),
                enabled: currOpp == Operation.select,
                onSelected: (value) {
                  setState(() {
                    value!.weight.weight > 0
                        ? selected = value
                        : selected = null;
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
          Visibility(
            visible: currOpp == Operation.add,
            child: NameWeightEntries(
              key: UniqueKey(),
              onComplete: () {
                setState(() {
                  currOpp = Operation.select;
                });
              },
            ),
          ),
          Visibility(
            visible: currOpp == Operation.edit,
            child: NameWeightEntries(
              key: UniqueKey(),
              onComplete: () {
                setState(() {
                  currOpp = Operation.select;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
