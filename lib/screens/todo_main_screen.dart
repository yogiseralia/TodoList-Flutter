import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/network/NetworkHelper.dart';
import 'package:todo_list_app/network/TodoSchema.dart';
import 'package:todo_list_app/screens/error_screen.dart';
import 'package:todo_list_app/screens/list_screen.dart';
import 'package:todo_list_app/screens/progress_screen.dart';
import 'file:///D:/Practice/Flutter/todo_list_app/lib/network/todo_list_result.dart';

class TodoMainScreen extends StatefulWidget {
  final NetworkHelper _networkHelper;

  TodoMainScreen(this._networkHelper);

  @override
  _TodoMainScreenState createState() => _TodoMainScreenState(_networkHelper);
}

class _TodoMainScreenState extends State<TodoMainScreen> {
  final NetworkHelper _networkHelper;
  Result _apiResult;
  List<TodoSchema> _todoSchemaList;
  bool _isInProgress = false;
  bool _isError = false;

  _TodoMainScreenState(this._networkHelper);

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    showProgress();

    _apiResult = await _networkHelper.getTodoFromAPI();

    if (_apiResult is ResultSuccess) {
      updateList((_apiResult as ResultSuccess).data);
    } else if (_apiResult is ResultError) {
      updateError((_apiResult as ResultError).exception);
    }

    hideProgress();
  }

  @override
  Widget build(BuildContext context) {
    if (_isInProgress)
      return buildScreen(ProgressScreen());
    else if (_isError)
      return buildScreen(ErrorScreen(getData));
    else
      return buildScreen(ListScreen(_todoSchemaList));
  }

  Scaffold buildScreen(Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: body,
    );
  }

  void hideProgress() {
    setState(() {
      _isInProgress = false;
    });
  }

  void showProgress() {
    setState(() {
      _isInProgress = true;
    });
  }

  void updateList(List<TodoSchema> todoSchemaList) {
    setState(() {
      this._todoSchemaList = todoSchemaList;
      _isError = false;
    });
  }

  void updateError(Exception e) {
    setState(() {
      _isError = true;
    });
  }
}
