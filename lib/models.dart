import 'package:flutter/foundation.dart';

enum VisibilityFilter { SHOW_ALL, SHOW_ACTIVE, SHOW_COMPLETED }
enum ButtonFilterPosition {LEFT, CENTER, RIGHT}

class Todo{
  final int id;
  final String text;
  final bool completed;

  const Todo({
    @required this.id,
    @required this.text,
    this.completed = false,
  });

  Todo copyWith({int id, String text, bool completed}) {
    return new Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'completed': completed,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          completed == other.completed;

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ completed.hashCode;
}

class TodoState {
  final Map<String, Todo> todos;
  final VisibilityFilter visibilityFilter;
  final String selectedTodoId;

  const TodoState({
    @required this.todos,
    @required this.visibilityFilter,
    @required this.selectedTodoId
  });

  TodoState.initialState()
      : todos = Map(),
        visibilityFilter = VisibilityFilter.SHOW_ALL,
        selectedTodoId = '';
}

typedef void TodoTapFunction(String id);

typedef void ToggleTodoFunction(Todo todo);

typedef void AddTodoPressedFunction(String text);

typedef void SetVisibilityFilterFunction(VisibilityFilter filter);
