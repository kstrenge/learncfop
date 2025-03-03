import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database? _database;

  static Future<void> openDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), "learncfop.db"),
      onCreate: (db, version) {
        return db.execute("""CREATE TABLE algorithms(id TEXT PRIMARY KEY,
                                                     label TEXT NOT NULL,
                                                     algorithm TEXT NOT NULL,
                                                     notes TEXT,
                                                     INTEGER isFavourite)""");
      },
    );
  }
}
<