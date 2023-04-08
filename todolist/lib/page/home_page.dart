import 'package:flutter/material.dart';
import 'package:todolist/main.dart';

import '../widget/add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [Container(), Container()];

    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'To do'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
              ),
              label: 'Completed')
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
