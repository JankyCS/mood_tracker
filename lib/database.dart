import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:mood_tracker/moodEntry.dart';

class DBProvider {
  DBProvider();
  static final DBProvider db = DBProvider();
  static Database _database;

  Future<Database> get database async {
    if(_database != null)
    {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'mood_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''
            CREATE TABLE moods(
              id INTEGER PRIMARY KEY, mood REAL, date TEXT,
              r0 INTEGER, r1 INTEGER, r2 INTEGER, r3 INTEGER, r4 INTEGER, r5 INTEGER,
              r6 INTEGER, r7 INTEGER, r8 INTEGER, r9 INTEGER, r10 INTEGER, r11 INTEGER
            )
          '''
        );
      },
      version:1
    );
  }

  newMood(MoodEntry newMood) async {
    final db = await database;
    var res = await db.rawInsert(
      '''
        INSERT INTO moods (
          mood, date, r0 , r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11
        ) values (? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', newMood.dbEntry()
    ); 

    return res;
  }

  Future<dynamic> getMood() async {
    //print("running Getmood");

    //await Future<String>.delayed(Duration(seconds: 1));
    final db = await database;

    var res = await db.query("moods");
    if(res.length==0){
      return 123;
    }
    else{
      var resMap = res;
      return resMap.isNotEmpty ? resMap : Null;
    }

  }

  Future<dynamic> deleteTable() async {
    final db = await database;
    await db.execute(
      '''
        DELETE FROM moods
      '''
    );
  }
}