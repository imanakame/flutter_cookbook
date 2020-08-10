import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  List<Map> todoList = [];
  List<Map> tempTodoList = [];

  void addTask(Map item) {
    todoList.add(item);
    notifyListeners(); // 変更を通知するために必要
  }

  void removeTempTodoList() {
    tempTodoList = [];
    notifyListeners();
  }

  void setTempTodoList(Map item) {
    tempTodoList.add(item);
    notifyListeners();
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