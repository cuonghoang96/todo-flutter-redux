
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/components/link.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/actions.dart';

class ViewModel {
  final bool active;
  final VoidCallback onPressed;

  ViewModel({
    @required this.active,
    @required this.onPressed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ViewModel &&
              runtimeType == other.runtimeType &&
              active == other.active;

  @override
  int get hashCode => active.hashCode;
}

class FilterLink extends StatelessWidget {
  final VisibilityFilter filter;
  final String text;
  final ButtonFilterPosition position;
  FilterLink({
    @required this.filter,
    @required this.text,
    @required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TodoState, ViewModel>(
      distinct: true,
      converter: (store) => new ViewModel(
        active: filter == store.state.visibilityFilter,
        onPressed: () => store.dispatch(
          new SetVisibilityFilterAction(filter: filter),
        ),
      ),
      builder: (context, viewModel) => new Link(
        active: viewModel.active,
        text: text,
        onPressed: viewModel.onPressed,
        position: position,
      ),
    );
  }
}