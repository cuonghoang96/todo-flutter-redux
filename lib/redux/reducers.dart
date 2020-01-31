import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';

List<Todo> todosReducer(List<Todo> state, TodoAction action) {
  if (action is AddTodoSuccessAction) {
    return <Todo>[]
      ..addAll(state)
      ..add(action.todo);
  }

  if (action is ToggleTodoSuccessAction) {
    return state
        .map((Todo todo) => todo.id == action.id
        ? todo.copyWith(completed: !todo.completed)
        : todo)
        .toList();
  }

  if (action is SetTodosAction) {
    return action.todos;
  }
  return state;
}

VisibilityFilter visibilityFilterReducer(VisibilityFilter state, action) {
  if (action is SetVisibilityFilterAction) {
    return action.filter;
  }

  return state;
}

TodoState todoAppReducer(TodoState state, dynamic action) {
  return new TodoState(
    todos: todosReducer(state.todos, action),
    visibilityFilter: visibilityFilterReducer(state.visibilityFilter, action),
  );
}