import 'package:flutter/foundation.dart';
import 'package:flutter_app/models.dart';

abstract class TodoAction {
  String toString() {
    return '$runtimeType';
  }
}

class GetTodosAction extends TodoAction {
}

class SetTodosAction extends TodoAction {
  final Map<String, Todo> todos;
  SetTodosAction({@required this.todos});
}

class AddTodoAction extends TodoAction {
  final String text;
  AddTodoAction({@required this.text});
}

class AddTodoSuccessAction extends TodoAction {
  final Todo todo;
  AddTodoSuccessAction({@required this.todo});
}

class SetVisibilityFilterAction extends TodoAction {
  final VisibilityFilter filter;
  SetVisibilityFilterAction({@required this.filter});
}

class ToggleTodoAction extends TodoAction {
  final Todo todo;
  ToggleTodoAction({@required this.todo});
}

class ToggleTodoSuccessAction extends TodoAction {
  final int id;
  ToggleTodoSuccessAction({@required this.id});
}

class SelectTodoAction extends TodoAction {
  final String id;
  SelectTodoAction({@required this.id});
}

class RemoveTodoAction extends TodoAction {
  final String id;
  RemoveTodoAction({@required this.id});
}

class RemoveTodoSuccessAction extends TodoAction {
  final String id;
  RemoveTodoSuccessAction({@required this.id});
}

class UpdateTodoAction extends TodoAction {
  final Todo todo;
  UpdateTodoAction({@required this.todo});
}

class UpdateTodoSuccessAction extends TodoAction {
  final Todo todo;
  UpdateTodoSuccessAction({@required this.todo});
}