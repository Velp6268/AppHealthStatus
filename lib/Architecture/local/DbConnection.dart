import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DB  {

  static final DB _db = new DB._internal();
  DB._internal();
  static DB get instance => _db;
  static late Database _database;

  Future<Database> get database async {
    if(_database != null)
      return _database;
    _database = await _init();
    return _database;

  }

  Future<Database> _init() async{
    return await openDatabase(

      join(await getDatabasesPath(), 'database_name.db'),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE group(id INTEGER PRIMARY KEY, imageName TEXT, fullName TEXT, textHealsStatus TEXT);",
        );
        db.execute(
          "CREATE TABLE status(id INTEGER PRIMARY KEY, imageName TEXT, textHealsStatus TEXT);",
        );
        db.execute(
          "CREATE TABLE profile(id INTEGER PRIMARY KEY, userId INTEGER, fullName TEXT, group TEXT, imageName TEXT, textHealsStatus TEXT);",
        );
        // more create statements....

      },

      version: 5,
    );
  }
}