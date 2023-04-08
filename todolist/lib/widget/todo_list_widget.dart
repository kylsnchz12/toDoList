import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/todos.dart';
import 'todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoWidget(todo: todo);
        },
        itemCount: todos.length);
  }
}
