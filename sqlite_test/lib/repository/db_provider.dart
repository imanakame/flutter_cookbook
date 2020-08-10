import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  static final _tableName = "Todo";
  static final _databaseName = "TodoDB.db";

  Future<Database> get database async {
    if (_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE Todo("
                "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                "title TEXT)",
          );
        },
        version: 1
    );
  }

  Future<void> deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, _databaseName);

    await deleteDatabase(path);
  }

  Future<List<Todo>> getTodo() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }

  Future<void> insertTodo(Todo todo) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      todo.toMap()
    );
  }

  Future<void> updateTodo(Todo todo) async {
    final Database db = await database;
    await db.update(
      _tableName,
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id]
    );
  }

}

class Todo {
  final int id;
  final String title;

  Todo({this.id, this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title
    };
  }
}