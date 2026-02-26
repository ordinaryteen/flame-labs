import 'package:flutter/material.dart';

class ConstraintsDrill extends StatelessWidget {
  ConstraintsDrill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 200,
        color: Colors.grey[300],
        child: UnconstrainedBox(
            child: Container(
                width: 100,
                height: 50,
                color: Colors.red,
                child: const Center(
                  child: Text("I miss mbak Ika",
                      style: TextStyle(color: Colors.white)),
                ))));
  }
}
