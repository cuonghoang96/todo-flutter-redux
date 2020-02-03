import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/todo_tile.dart';
import 'package:flutter_app/models.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  TodoList({
    @required this.todos,
    @required this.onTodoTap,
  });

  List<Widget> buildListItems() {
    return todos
        .map((todo) => new TodoTile(
              key: new Key(todo.id.toString()),
              todo: todo,
              onTap: onTodoTap,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            border: todos.length != 0
                ? Border.all(width: 1, color: Colors.black38)
                : null,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TodoTile(
              key: Key(todos[index].id.toString()),
              todo: todos[index],
              onTap: onTodoTap,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
