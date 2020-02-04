import 'package:flutter_app/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/redux/actions.dart';
import 'package:flutter_app/redux/database.dart';
import 'package:flutter_app/redux/midleware.dart';
import 'package:flutter_app/redux/reducers.dart';

void main() {
  group("Todo Reducers", () {
    TodoState state;
    setUp(() {
      state = TodoState.initialState();
    });
    group("SetVisibilityFilterAction", () {
      var setVisibilityFilterAction;
      setUp(() {
        setVisibilityFilterAction =
            (VisibilityFilter visibilityFilter) {
          return todoReducers(state, SetVisibilityFilterAction(filter: visibilityFilter));
        };
      });
      test("default", () {
        final nextState = setVisibilityFilterAction(VisibilityFilter.SHOW_ALL);
        expect(nextState, state);
      });
      test("any", (){
        final nextState = setVisibilityFilterAction(VisibilityFilter.SHOW_COMPLETED);
        expect(nextState, state.copyWith(visibilityFilter: VisibilityFilter.SHOW_COMPLETED));
      });
    });
    group("SelectTodoAction", (){
      var selectTodoAction;
      setUp((){
        selectTodoAction = (String selectedTodoId) {
          return todoReducers(state, SelectTodoAction(id: selectedTodoId));
        };
      });
      test("with empty", (){
        final nextState = selectTodoAction("");
        expect(nextState, state);
      });
      test("no empty", (){
        final nextState = selectTodoAction("1");
        expect(nextState, state.copyWith(selectedTodoId: "1"));
      });
    });
    group("SetTodosAction", (){
      var setTodosAction;
      setUp((){
        setTodosAction = (Map<String, Todo> todos) {
          return todoReducers(state, SetTodosAction(todos: todos));
        };
      });
      test("with empty", (){
        final nextState = setTodosAction(Map<String, Todo>());
        expect(nextState, state);
      });
      test("no empty", (){
        final todo = Todo(id: 1, text: "test");
        final nextState = setTodosAction({"${todo.id}": todo});
        expect(nextState, state.copyWith(todos: {"${todo.id}": todo}));
      });
    });
    group("AddTodoSuccessAction", (){
      var addTodoSuccessAction;
      setUp((){
        addTodoSuccessAction = (Todo  todo) {
          return todoReducers(state, AddTodoSuccessAction(todo: todo));
        };
      });
      test("has value", (){
        final todo = Todo(id: 1, text: "test");
        final nextState = addTodoSuccessAction(todo);
        expect(nextState, state.copyWith(
          todos: {
            "${todo.id}": todo,
          },
        ));
      });
    });
  });
}