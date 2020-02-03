import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screens/detailsScreen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/components/todo_list.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';
import 'package:equatable/equatable.dart';

class ViewModel extends Equatable {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;
  final ToggleTodoFunction onToggleTodo;
  ViewModel({this.todos, this.onTodoTap, this.onToggleTodo});

  @override
  // TODO: implement props
  List<Object> get props => [
        todos,
        onTodoTap,
        onToggleTodo,
      ];
}

class VisibleTodoList extends StatelessWidget {
  List<Todo> getVisibleTodos(Map<String, Todo> todos, VisibilityFilter filter) {
    var list = <Todo>[];
    switch (filter) {
      case VisibilityFilter.SHOW_ALL:
        todos.entries.forEach((e) => list.add(e.value));
        break;
      case VisibilityFilter.SHOW_COMPLETED:
        todos.entries.forEach((e) {
          if (e.value.completed) list.add(e.value);
        });
        break;
      case VisibilityFilter.SHOW_ACTIVE:
        todos.entries.forEach((e) {
          if (!e.value.completed) list.add(e.value);
        });
        break;
      default:
        break;
        ;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TodoState, ViewModel>(
      onInit: (store) {
        store.dispatch(GetTodosAction());
      },
      converter: (store) => new ViewModel(
          todos:
              getVisibleTodos(store.state.todos, store.state.visibilityFilter),
          onToggleTodo: (todo) => store.dispatch(
                new ToggleTodoAction(todo: todo),
              ),
          onTodoTap: (id) {
            store.dispatch(SelectTodoAction(id: id));
            Navigator.pushNamed(context, DetailsScreen.routeName);
          }),
      builder: (context, viewModel) => new TodoList(
        todos: viewModel.todos,
        onTodoTap: viewModel.onTodoTap,
        onToggleTodo: viewModel.onToggleTodo,
      ),
    );
  }
}
