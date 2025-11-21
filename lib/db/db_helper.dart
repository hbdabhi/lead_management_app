import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static final DBHelper instance = DBHelper._init();
  static Database? _database;
  DBHelper._init();

  Future <Database> get database async{
    if(_database !=null) return _database!;
    _database = await _initDB('Leads.db');
    return _database!;
  }
  Future<Database> _initDB(String filename) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filename);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  Future _createDB(Database db,int version) async {
    await db.execute('''
        CREATE TABLE leads(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          Name TEXT NOT NULL,
          Number TEXT NOT NULL,
          Status TEXT DEFAULT 'New',
          Description TEXT 
          );
    ''');
  }

  Future<int> insert(String table,Map<String,dynamic> data)async{
    final db= await instance.database;
    return db.insert(table, data);
  }

  Future<List<Map<String,dynamic>>> queryAll(String table) async{
    final db = await instance.database;
    return db.query(table);
  }
  Future<int> update(String table,Map<String,dynamic> data, int id) async{
    final db = await instance.database;
    return db.update(table,data,where: 'id = ?', whereArgs:[id]);
  }
  Future<int> delete(String table,int id) async{
    final db = await instance.database;
    return db.delete(table,where: 'id = ?',whereArgs: [id]);
  }
}
