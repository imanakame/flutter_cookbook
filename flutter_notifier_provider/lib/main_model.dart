import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  List<Map> todoList = [{"name": "テスト"}];

  void addTask(Map item) {
    todoList.add(item);
    notifyListeners(); // 変更を通知するために必要
  }

  void changeTask(int index ,String item) {
    todoList[index]["name"] = item;
    notifyListeners();
  }

  void removeTask(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }

  String getTaskName(int index) {
    return todoList[index]["name"];
  }

}
