import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/components/todo_list.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';

class ViewModel {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  ViewModel({
    this.todos,
    this.onTodoTap,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ViewModel &&
              runtimeType == other.runtimeType &&
              new ListEquality<Todo>().equals(todos, other.todos);

  @override
  int get hashCode => todos.hashCode;
}

class VisibleTodoList extends StatelessWidget {
  List<Todo> getVisibleTodos(List<Todo> todos, VisibilityFilter filter) {
    switch (filter) {
      case VisibilityFilter.SHOW_ALL:
        return todos;
      case VisibilityFilter.SHOW_COMPLETED:
        return todos.where((todo) => todo.completed).toList();
      case VisibilityFilter.SHOW_ACTIVE:
        return todos.where((todo) => !todo.completed).toList();
      default:
        return <Todo>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TodoState, ViewModel>(
      distinct: true,
      onInit: (store){
        store.dispatch(GetTodosAction());
      },
      converter: (store) => new ViewModel(
        todos: getVisibleTodos(
            store.state.todos, store.state.visibilityFilter),
        onTodoTap: (todo) => store.dispatch(
          new ToggleTodoAction(todo: todo),
        ),
      ),
      builder: (context, viewModel) => new TodoList(
        todos: viewModel.todos,
        onTodoTap: viewModel.onTodoTap,
      ),
    );
  }
}