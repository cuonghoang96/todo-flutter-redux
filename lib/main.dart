import 'package:flutter/material.dart';
import 'package:flutter_app/components/screens/detailsScreen.dart';
import 'package:flutter_app/redux/database.dart';
import 'package:flutter_app/redux/midleware.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app/components/app.dart';
import 'package:flutter_app/models.dart';
import 'package:flutter_app/redux/reducers.dart';
import 'package:path/path.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TodoDatabase.init(openDatabase(
    // Set the path to the database.
    join(await getDatabasesPath(), 'todo_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, subtitle TEXT, completed INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 3,
  ));
  runApp(new TodoApp());
}

class TodoApp extends StatelessWidget {
  final Store<TodoState> store = Store<TodoState>(todoReducers,
      initialState: TodoState.initialState(),
      middleware: [EpicMiddleware<TodoState>(TodoMiddleWare())]);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'todo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => App(),
          DetailsScreen.routeName: (context) => DetailsScreen()
        },
      ),
    );
  }
}
