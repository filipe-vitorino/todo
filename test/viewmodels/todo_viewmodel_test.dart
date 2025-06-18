import 'package:flutter_test/flutter_test.dart';
import '../../lib/viewmodel/todo_view_model.dart';

void main() {
  group('TodoViewModel Tests', () {
    late TodoViewModel viewModel;

    setUp(() {
      viewModel = TodoViewModel();
    });

    test('Adicionar uma tarefa', () {
      viewModel.addTodo('Estudar Flutter');
      expect(viewModel.todos.length, 1);
      expect(viewModel.todos.first.title, 'Estudar Flutter');
    });

    test('Não deve adicionar tarefa vazia', () {
      viewModel.addTodo('');
      expect(viewModel.todos.length, 0);
    });

    test('Marcar e desmarcar tarefa como concluída', () {
      viewModel.addTodo('Testar');
      final id = viewModel.todos.first.id;

      viewModel.toggleTodo(id);
      expect(viewModel.todos.first.isDone, true);

      viewModel.toggleTodo(id);
      expect(viewModel.todos.first.isDone, false);
    });

    test('Remover uma tarefa', () {
      viewModel.addTodo('Apagar tarefa');
      final id = viewModel.todos.first.id;

      viewModel.deleteTodo(id);
      expect(viewModel.todos.length, 0);
    });

    test('Limpar todas as tarefas', () {
      viewModel.addTodo('Tarefa 1');
      viewModel.addTodo('Tarefa 2');

      viewModel.clearTodos();
      expect(viewModel.todos.length, 0);
    });
  });
}
