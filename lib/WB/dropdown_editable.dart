import 'package:flutter/material.dart';
import 'package:wbx/WB/wb_text_entries.dart';
import 'package:wbx/model/item.dart';

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
                dropdownMenuEntries: widget.list.map((elem) {
                  return DropdownMenuEntry<Item>(
                    value: elem,
                    label: elem.name,
                    enabled: elem.weight > 0,
                  );
                }).toList(),
                enabled: currOpp == Operation.select,
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
                onPressed:
                    (currOpp == Operation.select && widget.list.isNotEmpty)
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
