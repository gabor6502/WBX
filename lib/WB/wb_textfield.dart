import 'package:flutter/material.dart';

class WbTextfield extends StatefulWidget {
  final String? hint;
  final Function onComplete;

  const WbTextfield({super.key, required this.onComplete, this.hint});

  @override
  State<WbTextfield> createState() => _WbTextfieldState();
}

class _WbTextfieldState extends State<WbTextfield> {
  final _textEditingController = TextEditingController();

  @override
  dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController
        ..text, // = widget.[however you access the param].name,
      onEditingComplete: () {
        //changeName(_textEditingController.text);
      },
      onTapOutside: (event) {
        //changeName(_textEditingController.text);
      },
      autofocus: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.green),
        constraints: BoxConstraints(maxWidth: 300, maxHeight: 100),
        hintText: widget.hint,
      ),
    );
  }
}
