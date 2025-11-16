import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextEntry extends StatefulWidget {
  final String labelText;
  final String hintText;

  const TextEntry({super.key, required this.hintText, required this.labelText});

  @override
  State<TextEntry> createState() => _TextEntryState();
}

class _TextEntryState extends State<TextEntry> {
  final _weightEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _weightEditingController,
        key: UniqueKey(),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintStyle: TextStyle(color: Colors.pink.shade500),
          constraints: BoxConstraints(maxWidth: 300, maxHeight: 100),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
