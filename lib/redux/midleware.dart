import 'package:flutter_app/redux/database.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';

class TodoMiddleWare implements EpicClass<TodoState> {
  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<TodoState> store) {
    // TODO: implement call
    return combineEpics<TodoState>([addTodoEpic, getTodosEpic, toggleTodoEpic, removeTodoEpic])(
        actions, store);
  }

  Stream<dynamic> addTodoEpic(
      Stream<dynamic> actions, EpicStore<TodoState> store) {
    return actions
        .where((action) => action is AddTodoAction)
        .asyncMap((action) async {
      final todo = Todo(text: action.text);
      var response = await TodoDatabase().insertTodo(todo);
      return AddTodoSuccessAction(todo: todo.copyWith(id: response));
    });
  }

  Stream<dynamic> getTodosEpic(
      Stream<dynamic> actions, EpicStore<TodoState> store) {
    return actions
        .where((action) => action is GetTodosAction)
        .asyncMap((action) async {
      var response = await TodoDatabase().todos();
      return SetTodosAction(todos: Map.fromIterable(response, key: (e) => '${e.id}', value: (e) => e));
    });
  }

  Stream<dynamic> toggleTodoEpic(
      Stream<dynamic> actions, EpicStore<TodoState> store) {
    return actions
        .where((action) => action is ToggleTodoAction)
        .asyncMap((action) async {
      var response = await TodoDatabase().toggleTodo(action.todo.copyWith(completed: !action.todo.completed));
      if (response == 1)
        return ToggleTodoSuccessAction(id: action.todo.id);
      else
        return null;
    });
  }

  Stream<dynamic> removeTodoEpic(
      Stream<dynamic> actions, EpicStore<TodoState> store) {
    return actions
        .where((action) => action is RemoveTodoAction)
        .asyncMap((action) async {
      var response = await TodoDatabase().removeTodo(action.id);
      if (response == 1)
        return RemoveTodoSuccessAction(id: action.id);
      else
        return null;
    });
  }
}
