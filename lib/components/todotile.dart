// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
   TodoTile(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.taskCompleted, required this.onLongPress});

  final String text;
  final Function(bool?)? onChanged;
  final bool taskCompleted;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        text,
        style: TextStyle(
            decoration: taskCompleted ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        shape: CircleBorder(),
        value: taskCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
