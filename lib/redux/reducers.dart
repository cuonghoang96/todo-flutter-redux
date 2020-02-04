import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';
import 'package:redux/redux.dart';

final Reducer<TodoState> todoReducers = combineReducers<TodoState>([
  TypedReducer<TodoState, AddTodoSuccessAction>(_addTodoSuccessAcion),
  TypedReducer<TodoState, ToggleTodoSuccessAction>(_toggleTodoSuccessAction),
  TypedReducer<TodoState, RemoveTodoSuccessAction>(_removeTodoSuccessAction),
  TypedReducer<TodoState, SetTodosAction>(_setTodosAction),
  TypedReducer<TodoState, SelectTodoAction>(_selectTodoAction),
  TypedReducer<TodoState, SetVisibilityFilterAction>(_setVisibilityFilterAction)
]);

TodoState _addTodoSuccessAcion(TodoState state, AddTodoSuccessAction action) {
  final todo = action.todo;
  state.todos['${todo.id}'] = todo;
  return state.copyWith(todos: state.todos);
}

TodoState _toggleTodoSuccessAction(TodoState state, ToggleTodoSuccessAction action) {
  final todo = state.todos['${action.id}'];
  state.todos['${action.id}'] = todo.copyWith(completed: !todo.completed);
  return state.copyWith(todos: state.todos);
}

TodoState _removeTodoSuccessAction(TodoState state, RemoveTodoSuccessAction action) {
  state.todos.remove(action.id);
  return state.copyWith(todos: state.todos);
}

TodoState _setTodosAction(TodoState state, SetTodosAction action) {
  return state.copyWith(todos: action.todos);
}

TodoState _selectTodoAction(TodoState state, SelectTodoAction action) {
  return state.copyWith(selectedTodoId: action.id);
}

TodoState _setVisibilityFilterAction(TodoState state, SetVisibilityFilterAction action) {
  return state.copyWith(visibilityFilter: action.filter);
}