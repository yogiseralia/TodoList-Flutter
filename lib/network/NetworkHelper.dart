import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/network/TodoSchema.dart';
import 'file:///D:/Practice/Flutter/todo_list_app/lib/network/todo_list_result.dart';

class NetworkHelper {
  Future<Result> getTodoFromAPI() async {
    try {
      http.Response response = await http.get(TODOs_URL);
      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        List<TodoSchema> todoSchemaList =
            list.map((e) => TodoSchema.fromJson(e)).toList();
        return ResultSuccess(todoSchemaList);
      } else
        return ResultError(Exception('${response.statusCode}'));
    } catch (e) {
      print(e);
      return ResultError(e);
    }
  }
}
