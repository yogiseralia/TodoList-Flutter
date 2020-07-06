import 'package:flutter/material.dart';
import 'package:todo_list_app/network/TodoSchema.dart';

class ListScreen extends StatelessWidget {
  final List<TodoSchema> todoSchemaList;

  ListScreen(this.todoSchemaList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          TodoSchema todoSchema = todoSchemaList[index];
          return ListTile(
            title: Text(todoSchema.title),
            leading: Text('${todoSchema.id}'),
            trailing: getCompletedIcon(todoSchema),
          );
        },
        itemCount: todoSchemaList == null ? 0 : todoSchemaList.length,
      ),
    );
  }

  Icon getCompletedIcon(TodoSchema todoSchema) {
    return todoSchema.completed
              ? Icon(
            Icons.check,
            color: Colors.green,
          )
              : Icon(
            Icons.close,
            color: Colors.red,
          );
  }
}
