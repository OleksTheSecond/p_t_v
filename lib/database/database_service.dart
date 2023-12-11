import 'package:p_t_v/database/book_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const String name = 'p_t_v.db';
    final String path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final String path = await fullPath;
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await BookDB().createTable(database);
}
