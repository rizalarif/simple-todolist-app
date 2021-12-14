import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_list_app/data/todo_data.dart';
import 'package:todo_list_app/models/todo.dart';

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = todosList;

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void doneToggle(int id) {
    var index = _todos.indexWhere((element) => element.id == id);
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void remove(int id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Todo getTodo(int id) {
    return _todos.where((element) => element.id == id).first;
  }

  void updateTodo(Todo newtodo) {
    _todos = [
      for (final todo in _todos)
        if (todo.id == newtodo.id) newtodo else todo
        
    ];
  }
}
