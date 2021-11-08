import 'package:flutter/material.dart';
class Tag extends StatelessWidget {
  final int? id;
  final String? name;
  const Tag({Key? key, this.id, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Text("$name!",)),
    );
  }
}