import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/todos.dart';

import '../model/todo.dart';
import '../page/edit_todo_page.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    const snackBar = SnackBar(
      content: Text('Deleted the task'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo)));

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      viewportBuilder: (BuildContext context, ViewportOffset position) =>
          ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          key: Key(todo.id),
          startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (h) => editTodo(context, todo),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ]),
          endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (context) => deleteTodo(context, todo),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ]),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: [
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  value: todo.isDone,
                  onChanged: (_) {
                    final provider =
                        Provider.of<TodosProvider>(context, listen: false);
                    final isDone = provider.toggleTodoStatus(todo);

                    if (isDone == true) {
                      const snackBar = SnackBar(
                        content: Text('Task Completed!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 22),
                      ),
                      if (todo.description.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            todo.description,
                            style: const TextStyle(
                              fontSize: 20,
                              height: 1.5,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
