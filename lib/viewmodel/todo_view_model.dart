import 'package:flutter/material.dart';
import '../model/todo.dart';
import 'package:uuid/uuid.dart';

class TodoViewModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  void addTodo(String title) {
    if (title.isEmpty) return;
    _todos.add(Todo(id: const Uuid().v4(), title: title));
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isDone = !_todos[index].isDone;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void clearTodos() {
    _todos.clear();
    notifyListeners();
  }
}
