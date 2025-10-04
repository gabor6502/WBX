import 'package:flutter/material.dart';

class WbTextEntries extends StatefulWidget {
  final void Function() onComplete;

  const WbTextEntries({super.key, required this.onComplete});

  @override
  State<WbTextEntries> createState() => _WbTextEntriesState();
}

class _WbTextEntriesState extends State<WbTextEntries> {
  final _nameEditingController = TextEditingController();
  final _weightEditingController = TextEditingController();

  @override
  dispose() {
    _nameEditingController.dispose();
    _weightEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 6, color: Colors.pink.shade700)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameEditingController,
            //..text = widget.[however you access the param].name,
            autofocus: true,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.pink.shade500),
              constraints: BoxConstraints(maxWidth: 300, maxHeight: 100),
              hintText: "Enter name",
            ),
          ),
          TextField(
            controller: _weightEditingController,
            //..text = widget.[however you access the param].name,
            autofocus: false,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.pink.shade500),
              constraints: BoxConstraints(maxWidth: 300, maxHeight: 100),
              hintText: "Enter weight",
            ),
          ),
          Row(
            children: [
              IconButton(
                // save changes
                onPressed: () {
                  widget.onComplete();
                },
                icon: Icon(Icons.done),
              ),
              IconButton(
                // cancel
                onPressed: () {
                  widget.onComplete();
                },
                icon: Icon(Icons.cancel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
