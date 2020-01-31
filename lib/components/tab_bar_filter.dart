import 'package:flutter/material.dart';
import 'package:flutter_app/containers/filter_link.dart';
import 'package:flutter_app/models.dart';

class TabBarFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FilterLink(
            text: 'All',
            position: ButtonFilterPosition.LEFT,
            filter: VisibilityFilter.SHOW_ALL,
          ),
          FilterLink(
            text: 'Active',
            position: ButtonFilterPosition.CENTER,
            filter: VisibilityFilter.SHOW_ACTIVE,
          ),
          FilterLink(
            text: 'Completed',
            position: ButtonFilterPosition.RIGHT,
            filter: VisibilityFilter.SHOW_COMPLETED,
          ),
        ],
      ),
    );
  }
}