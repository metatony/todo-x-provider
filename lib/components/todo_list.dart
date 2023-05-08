// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/my_notifier.dart';
import 'todotile.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Consumer<NotifierState>(
        builder: (BuildContext context, value, child) {
          return ListView(
            children: [
              ...List.generate(
                  Provider.of<NotifierState>(context).taskList.length, (index) {
                return TodoTile(
                  text: Provider.of<NotifierState>(context).taskList[index][0],
                  onChanged: (value) {
                    Provider.of<NotifierState>(context, listen: false)
                        .checkBoxChanged(index);
                  },
                  taskCompleted:
                      Provider.of<NotifierState>(context).taskList[index][1],
                  onLongPress: () {
                    Provider.of<NotifierState>(context, listen: false).deleteTask(index);
                  },
                );
              })
            ],
          );
        },
      ),
    );
  }
}

// void checkBoxChanged(int index) {
  //   setState(() {
  //     taskList[index][1] = !taskList[index][1];
  //   });
  // }
