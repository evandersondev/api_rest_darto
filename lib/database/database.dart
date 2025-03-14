import 'package:sqlite3/sqlite3.dart';

class Database {
  Database._internal();
  static final Database instance = Database._internal();

  final db = sqlite3.openInMemory();

  void init() {
    db.execute('''
      CREATE TABLE todos (
        id INTEGER NOT NULL PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        is_done INTEGER NOT NULL
        );
      ''');
  }
}
