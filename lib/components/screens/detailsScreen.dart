import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  static const routeName = '/Details';

  DetailsScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
    );
  }
}