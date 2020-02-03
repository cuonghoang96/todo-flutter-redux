import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';

Map<String, Todo> todosReducer(Map<String, Todo> state, TodoAction action) {
  if (action is AddTodoSuccessAction) {
    state['${action.todo.id}'] = action.todo;
  }

  if (action is ToggleTodoSuccessAction) {
    var todo = state['${action.id}'];
    state['${action.id}'] = todo.copyWith(completed: !todo.completed);
  }

  if (action is RemoveTodoSuccessAction) {
    state.remove(action.id);
  }
  if (action is SetTodosAction) {
    return action.todos;
  }
  
  return state;
}

String todoReducer(String state, TodoAction action) {
  if(action is SelectTodoAction){
    return action.id;
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
    selectedTodoId: todoReducer(state.selectedTodoId, action),
    visibilityFilter: visibilityFilterReducer(state.visibilityFilter, action),
  );
}