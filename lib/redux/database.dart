import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class TodoDatabase {
  Future<Database> _database;
  static TodoDatabase _todoDatabase;
  static TodoDatabase get todoDatabase => _todoDatabase;
  static init(arg) => _todoDatabase ??= TodoDatabase._init(arg);

  TodoDatabase._init(this._database);

  factory TodoDatabase() {
    return _todoDatabase;
  }

  Future<int> insertTodo(Todo todo) async {
    // Get a reference to the database.
    final Database db = await _database;
    return db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateTodo(Todo todo) async {
    // Get a reference to the database.
    final Database db = await _database;
    print(todo.toMap());
    return db.update('todos', todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
  }

  Future<List<Todo>> todos() async {
    // Get a reference to the database.
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        text: maps[i]['text'],
        completed: maps[i]['completed'] == 1,
        subtitle: maps[i]['subtitle']
      );
    });
  }

  Future<int> removeTodo(String id) async {
    // Get a reference to the database.
    final Database db = await _database;
    return db.delete('todos', where: "id = ?", whereArgs: [id]);
  }
}