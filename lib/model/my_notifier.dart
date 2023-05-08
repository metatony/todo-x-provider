import 'package:flutter/material.dart';

class NotifierState extends ChangeNotifier {
  List taskList = [
    ['go to the store', false],
    ['go to school', false],
  ];

  void checkBoxChanged(int index) {
    taskList[index][1] = !taskList[index][1];
    notifyListeners();
  }

  void createTask(String text) {
    taskList.add([text, false]);
    notifyListeners();
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
    notifyListeners();
  }
}
