import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Todo App';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: const Color(0xFFf6f5ee),
        ),
        home: HomePage(),
      );
}
