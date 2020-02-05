import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final AddSubtitlePressedFunction onAddSubtitlePressed;
  ViewModel({
    @required this.onAddSubtitlePressed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AddSubtitleTodo extends StatefulWidget {
  @override
  AddSubtitleTodoState createState() => new AddSubtitleTodoState();
}

class AddSubtitleTodoState extends State<AddSubtitleTodo> {
  final TextEditingController controller = new TextEditingController();
  AddSubtitlePressedFunction onAddSubtitlePressed;

  Store<TodoState> _store;

  @override
  Widget build(BuildContext context) {
    if (_store == null) _store = StoreProvider.of(context);
    controller.text = _store.state.todos[_store.state.selectedTodoId].subtitle;
    return TextField(
      controller: controller,
      decoration: new InputDecoration(hintText: 'Subtitle'),
      onSubmitted: (text) {
        _store.dispatch(UpdateTodoAction(todo:  _store.state.todos[_store.state.selectedTodoId].copyWith(subtitle: text)));
      },
    );
  }
}
