import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum VisibilityFilter { SHOW_ALL, SHOW_ACTIVE, SHOW_COMPLETED }
enum ButtonFilterPosition {LEFT, CENTER, RIGHT}

class Todo{
  final int id;
  final String text;
  final bool completed;
  final String subtitle;
  const Todo({
    @required this.id,
    @required this.text,
    this.completed = false,
    this.subtitle = ""
  });

  Todo copyWith({int id, String text, bool completed, String subtitle}) {
    return new Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      completed: completed ?? this.completed,
      subtitle: subtitle ?? this.subtitle
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'completed': completed,
      'subtitle': subtitle,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          subtitle == other.subtitle &&
          completed == other.completed;

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ completed.hashCode;
}

class TodoState extends Equatable {
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
  @override
  // TODO: implement props
  List<Object> get props => [
    todos,
    visibilityFilter,
    selectedTodoId
  ];

  TodoState copyWith(
      {Map<String, Todo> todos,
        VisibilityFilter visibilityFilter,
        String selectedTodoId}) {
    return TodoState(
      todos: todos ?? this.todos,
      visibilityFilter: visibilityFilter ?? this.visibilityFilter,
      selectedTodoId: selectedTodoId ?? this.selectedTodoId
    );
  }
}

typedef void TodoTapFunction(String id);

typedef void ToggleTodoFunction(Todo todo);

typedef void AddTodoPressedFunction(String text);

typedef void SetVisibilityFilterFunction(VisibilityFilter filter);

typedef void RemoveTodoPressedFunction(String id);

typedef void AddSubtitlePressedFunction(String text);