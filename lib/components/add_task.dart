// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({
    super.key,
    required this.onPressed,
    required this.controller,
  });

  final TextEditingController controller;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: MaterialButton(
              color: Colors.lightBlue,
              padding: EdgeInsets.all(5),
              onPressed: onPressed,
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
