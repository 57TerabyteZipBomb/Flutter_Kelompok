import 'package:path/path.dart';
import 'package:flutter_kelompok/models/todo_models.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            summary TEXT,
            urgency TEXT,
            due TEXT,
            isClear INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertTodo(Lists list) async {
    final client = await db;
    return client.insert('todos', list.toMap());
  }

  Future<List<Lists>> getTodos() async {
    final client = await db;
    final res = await client.query('todos', orderBy: 'id DESC');
    return res.map((e) => Lists.fromMap(e)).toList();
  }

  Future<int> updateTodo(int id, Lists list) async {
    final client = await db;
    return client.update(
      'todos',
      list.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final client = await db;
    return client.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
