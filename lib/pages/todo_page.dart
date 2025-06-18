import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/todo_view_model.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoViewModel = context.watch<TodoViewModel>();
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              todoViewModel.clearTodos();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(labelText: 'Nova tarefa'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    todoViewModel.addTodo(controller.text);
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoViewModel.todos.length,
              itemBuilder: (context, index) {
                final todo = todoViewModel.todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) {
                      todoViewModel.toggleTodo(todo.id);
                    },
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      todoViewModel.deleteTodo(todo.id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
