import 'package:flutter/material.dart';

class TodoList {
  List<String> title;
  List<bool> isdone;

  TodoList({required this.title}) : isdone = List.filled(title.length, false);

  void sync() {
    if (isdone.length != title.length) {
      isdone = List.filled(title.length, false);
    }
  }
}

class Listprovider extends ChangeNotifier {
  List<String> worktitle = [''];
  List<TodoList> alllist = [];

  void addlist() {
    worktitle.add('');
    notifyListeners();
  }

  void removeworktitle(int index) {
    worktitle.removeAt(index);
    notifyListeners();
  }

  void savetitle(String value, int index) {
    worktitle[index] = value;
  }

  void savelist() {
    if (alllist.isEmpty) {
      alllist.add(TodoList(title: List.from(worktitle)));
    } else {
      final todo = alllist.first;
      todo.title.addAll(worktitle);
      todo.sync();
    }

    worktitle = [''];
    notifyListeners();
  }
}
