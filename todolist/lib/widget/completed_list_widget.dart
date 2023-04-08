import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widget/todo_widget.dart';

import '../provider/todos.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? const Center(
            child: Text(
            'No completed tasks.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ))
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            itemCount: todos.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 8,
              );
            },
          );
  }
}
