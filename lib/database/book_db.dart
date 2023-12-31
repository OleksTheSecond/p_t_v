import 'package:p_t_v/database/database_service.dart';
import 'package:p_t_v/model/book.dart';
import 'package:sqflite/sqflite.dart';

class BookDB {
  final String tableName = 'book';

  Future<void> createTable(Database database) async {
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "name" TEXT NOT NULL,
      "path" TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
    );
""");
  }

  Future<int> create({required Book book}) async {
    final Database database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (name, path) VALUES (?, ?)''',
      [book.name, book.path],
    );
  }

  Future<List<Book>> fetchAll() async {
    final Database database = await DatabaseService().database;
    final books = await database.rawQuery('''SELECT * FROM $tableName''');
    return books.map((book) => Book.fromSQLDatabase(book)).toList();
  }

  Future<Book> fetchById(int id) async {
    final Database database = await DatabaseService().database;
    final book = await database
        .rawQuery('''SELECT * FROM $tableName WHERE id = ?''', [id]);
    return Book.fromSQLDatabase(book.first);
  }

  Future<int> update({required int id, required Book book}) async {
    final Database database = await DatabaseService().database;
    return await database.update(
      tableName,
      {
        'name': book.name,
        'path': book.path,
      },
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final Database database = await DatabaseService().database;
    await database.rawDelete("""DELETE FROM $tableName WHERE id = ?""", [id]);
  }

  Future<void> deleteByPath(Book book) async {
    final Database database = await DatabaseService().database;
    await database
        .rawDelete("""DELETE FROM $tableName WHERE path = ?""", [book.path]);
  }
}
