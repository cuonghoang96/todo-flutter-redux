import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screens/detailsScreen.dart';
import 'package:flutter_app/models.dart';

class TodoTile extends StatelessWidget {
  final Key key;
  final TodoTapFunction onTap;
  final ToggleTodoFunction onToggle;
  final RemoveTodoPressedFunction onRemove;
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
    @required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(
          todo.text,
          style: todo.completed ? completedTextStyle : null,
        ),
        subtitle: new Text(todo.subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey),),
        onTap: () => onTap('${todo.id}'),
        trailing: Row(
          children: <Widget>[
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(8),
                width: 40,
                height: 40,
                color: Colors.transparent,
                child: Center(
                  child: Icon(
                    todo.completed
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    size: 24,
                  ),
                ),
              ),
              onTap: () => onToggle(todo),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(8),
                width: 40,
                height: 40,
                color: Colors.transparent,
                child: Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ),
              onTap: () => onRemove('${todo.id}'),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ));
  }
}
