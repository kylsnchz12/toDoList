import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo.dart';
import 'todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoWidget(
        todo: Todo(createdTime: DateTime.now(), title: 'Walk the dog'));
  }
}
