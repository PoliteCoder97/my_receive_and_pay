import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  int _dbVersion = 4;
  Database _db;

  Future<Database> getDb() async {
    if (_db != null) return _db;

    _db = await makeDb();
    return _db;
  }

  Future close() async {
    var db = await getDb();
//    db.close();
  }

  makeDb() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'mydb.db');

    var myDb = await openDatabase(path,
        version: _dbVersion, onCreate: onCreate, onUpgrade: onUpgrade);
    return myDb;
  }

  void onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE banks(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT,amount INTEGER,cardNumber TEXT,cardDate TEXT,color TEXT)');
    await db.execute(
        'CREATE TABLE transactions(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,bankId INTEGER,count INTEGER,isPay INTEGER, forWhat TEXT)');
  }

  void onUpgrade(Database db, int newVersion, int oldVersion) async {
    await db.execute('DROP table if exists banks');
    await db.execute('DROP table if exists accounts');

    onCreate(db, newVersion);
  }
}
