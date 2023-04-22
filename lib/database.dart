import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import '../models/Yoga_model.dart';

class YogaDatabase {
  static Future<sql.Database> database() async {
    return sql.openDatabase('database.db', version: 1,
        onCreate: ((db, version) async {
      db.execute(YogaModel().yogaTable);
    }));
  }

  static Future<void> addFav(YogaModel yogaModel) async {
    final db = await database();
    await db.insert('yogaTable', yogaModel.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getFav() async {
    final db = await database();
    return db.query('yogaTable');
  }
}
