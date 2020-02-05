import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/containers/add_subtitle.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ViewModel {
  final Todo todo;
  final ToggleTodoFunction onToggleTodo;
  ViewModel({
    this.todo,
    this.onToggleTodo,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        todo,
        onToggleTodo,
      ];
}

class DetailsScreen extends StatefulWidget {
  static const routeName = '/Details';

  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<TodoState, ViewModel>(
      converter: (store) => new ViewModel(
        todo: store.state.todos[store.state.selectedTodoId],
        onToggleTodo: (todo) => store.dispatch(
          new ToggleTodoAction(todo: todo),
        ),
      ),
      builder: (context, ViewModel) => Scaffold(
        appBar: AppBar(
          title: Text(ViewModel.todo.text),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AddSubtitleTodo(),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  ViewModel.onToggleTodo(ViewModel.todo);
                },
                child: Text(
                  ViewModel.todo.completed ? 'Complete' : 'Uncomplete',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
