import 'package:flutter/material.dart';
import 'package:todo_list_app/network/NetworkHelper.dart';
import 'package:todo_list_app/screens/todo_main_screen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoMainScreen(
        NetworkHelper(),
      ),
    );
  }
}
