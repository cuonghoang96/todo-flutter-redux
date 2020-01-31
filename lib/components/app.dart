import 'package:flutter/material.dart';
import 'package:flutter_app/components/tab_bar_filter.dart';
import 'package:flutter_app/containers/add_todo.dart';
import 'package:flutter_app/containers/visible_todo_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Todos'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TabBarFilter(),
              VisibleTodoList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add',
            child: Icon(Icons.add),
            backgroundColor: Color(0xFFF44336),
            onPressed: () => showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("Add"),
                    content: AddTodo(),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                })));
  }
}
