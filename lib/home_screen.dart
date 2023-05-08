// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/add_task.dart';
import 'components/todo_list.dart';
import 'model/my_notifier.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = TextEditingController();

  Widget bottomSheet(context) {
    return AddTask(
      onPressed: () {
       Provider.of<NotifierState>(context, listen: false).createTask(_controller.text);
      _controller.clear();
      Navigator.pop(context);
      },
      controller: _controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(context: context, builder: bottomSheet);
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text('Todo',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                  SizedBox(height: 10),
                  Text(
                      '${Provider.of<NotifierState>(context).taskList.length.toString()} Tasks',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: TodoList(),
            ),
          ],
        ),
      ),
    );
  }
}
