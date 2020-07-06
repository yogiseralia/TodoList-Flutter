import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_list_app/network/TodoSchema.dart';

class TodoListResult extends ChangeNotifier {
  Result _result;

  TodoListResult(this._result);

  Result get result => _result;
}

class Result {}

class ResultSuccess extends Result {
  final List<TodoSchema> _data;

  ResultSuccess(this._data);

  List<TodoSchema> get data => UnmodifiableListView(_data);

  @override
  String toString() {
    return 'ResultSuccess{_data: $_data}';
  }
}

class ResultError extends Result {
  final Exception _exception;

  ResultError(this._exception);

  Exception get exception => _exception;

  @override
  String toString() {
    return 'ResultError{_exception: $_exception}';
  }
}

class ResultReset extends Result {}