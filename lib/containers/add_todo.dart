import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';

class ViewModel {
  final AddTodoPressedFunction onAddPressed;

  ViewModel({
    @required this.onAddPressed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AddTodo extends StatefulWidget {

  @override
  AddTodoState createState() => new AddTodoState();
}

class AddTodoState extends State<AddTodo> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TodoState, ViewModel>(
      distinct: true,
      converter: (store) => new ViewModel(
        onAddPressed: (todoText) => store.dispatch(
          new AddTodoAction(text: todoText),
        ),
      ),
      builder: (context, viewModel) => new TextField(
        controller: controller,
        decoration: new InputDecoration(hintText: 'Sample'),
        onSubmitted: (todoText) {
          viewModel.onAddPressed(todoText);
          controller.text = '';
          Navigator.of(context).pop();
        },
      ),
    );
  }
}