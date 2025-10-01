import 'package:flutter/material.dart';
import 'package:wbx/WB/wb_textfield.dart';

enum Operation { select, edit, add }

class DropdownEditable<T> extends StatefulWidget {
  final List<T> list;
  final String label;

  const DropdownEditable({super.key, required this.list, required this.label});

  @override
  State<DropdownEditable> createState() => _DropdownEditableState<T>();
}

class _DropdownEditableState<T> extends State<DropdownEditable> {
  Operation currOpp = Operation.select;

  // based on current operation, get an activity for the user to perform
  getActivity() {
    if (currOpp == Operation.select) {
      return DropdownMenu<T>(
        requestFocusOnTap: true,
        label: Text(widget.label),
        dropdownMenuEntries: widget.list.map((elem) {
          return DropdownMenuEntry<T>(value: elem, label: elem.name);
        }).toList(),
      );
    } else if (currOpp == Operation.add) {
      return WbTextfield(
        key: UniqueKey(),
        onComplete: () {
          setState(() {
            currOpp == Operation.select;
          });
        },
      );
    } else if (currOpp == Operation.edit) {
      return WbTextfield(
        key: UniqueKey(),
        onComplete: () {
          setState(() {
            currOpp == Operation.select;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.blueGrey)),
      ),
      child: Row(
        children: [
          getActivity(),
          IconButton(
            onPressed: () {
              setState(() {
                currOpp = Operation.add;
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currOpp = Operation.edit;
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
