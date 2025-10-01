import 'package:flutter/material.dart';
import 'package:wbx/WB/weight_and_balance.dart';

void main() {
  runApp(const WBX());
}

class WBX extends StatelessWidget {
  const WBX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade700,
          title: const Text(
            'How much u weigh? 🫣',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: WeightAndBalance(),
      ),
    );
  }
}
