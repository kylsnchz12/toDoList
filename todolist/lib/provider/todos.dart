import 'package:flutter/cupertino.dart';

import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Walk the dog'),
    Todo(createdTime: DateTime.now(), title: 'Billies birthday')
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
