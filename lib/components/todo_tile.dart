import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screens/detailsScreen.dart';
import 'package:flutter_app/models.dart';

class TodoTile extends StatelessWidget {
  final Key key;
  final TodoTapFunction onTap;
  final ToggleTodoFunction onToggle;
  final Todo todo;

  final TextStyle completedTextStyle = new TextStyle(
    decoration: new TextDecoration.combine([
      TextDecoration.lineThrough,
    ]),
  );

  TodoTile({
    @required this.key,
    @required this.onTap,
    @required this.todo,
    @required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        todo.text,
        style: todo.completed ? completedTextStyle : null,
      ),
      onTap: () => onTap('${todo.id}'),
        trailing: GestureDetector(
          child: Icon(todo.completed ? Icons.check_box : Icons.check_box_outline_blank),
          onTap: () => onToggle(todo),
        )
    );
  }
}
